import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Maximize
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.ThreeColumns
import XMonad.Util.NamedScratchpad
import XMonad.Actions.CycleWS
import XMonad.Actions.DynamicProjects
import XMonad.Actions.SpawnOn
import XMonad.Hooks.SetWMName

import System.IO

mySpacing = 7

myTabTheme = def {
  fontName = "xft:Gotham HTF Black:size=12",
  decoHeight = 40,
  activeColor = "#fff166",
  activeBorderColor = "#fff166",
  activeTextColor = "#000000",
  inactiveColor = "#dad9d6",
  inactiveBorderColor = "#dad9d6",
  inactiveTextColor = "#000000"
}

substring :: String -> String -> Bool
substring (x:xs) [] = False
substring xs ys
    | prefix xs ys = True
    | substring xs (tail ys) = True
    | otherwise = False

prefix :: String -> String -> Bool
prefix [] ys = True
prefix (x:xs) [] = False
prefix (x:xs) (y:ys) = (x == y) && prefix xs ys

scratchpads =
    [(NS "cmus" "st -c cmus cmus" (className =? "cmus") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "vlc" "vlc" (className =? "vlc") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "ranger" "st -c ranger ranger" (className =? "ranger") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "spotify" "spotify --force-device-scale-factor=2 --role=spotify" (stringProperty "_NET_WM_NAME" =? "Spotify") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ]

mylayoutHook = maximize ((  toggleLayouts (noBorders $ tabbed shrinkText myTabTheme) (spacing mySpacing $ (Tall 1 (3/100) (1/2)) ||| ThreeColMid 1 (2/20) (1/2) )))
myFocusFollowsMouse = False
myKeys = [((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
         , ((mod4Mask .|. shiftMask, xK_t), sendMessage ToggleStruts)
         , ((mod4Mask, xK_r), namedScratchpadAction scratchpads "ranger")
         , ((mod4Mask, xK_s), namedScratchpadAction scratchpads "cmus")
        , ((mod4Mask, xK_v), namedScratchpadAction scratchpads "vlc")
        , ((mod4Mask, xK_BackSpace), kill)
        , ((mod4Mask, xK_o), swapNextScreen)
        , ((mod4Mask .|. controlMask, xK_Right), prevScreen)
        , ((mod4Mask .|. controlMask, xK_Left),  nextScreen)
        , ((mod4Mask .|. controlMask, xK_o),  shiftNextScreen)
        , ((mod4Mask, xK_Tab),  toggleWS)
        , ((mod4Mask, xK_bracketleft),  prevWS)
        , ((mod4Mask, xK_bracketright),  nextWS)
        , ((mod4Mask, xK_m), withFocused (sendMessage . maximizeRestore))
        , ((mod4Mask, xK_equal), spawn "amixer set Master 2+ unmute")
        , ((mod4Mask, xK_minus), spawn "amixer set Master 2- unmute")
        , ((mod4Mask, xK_z), sendMessage ToggleLayout)
        , ((mod4Mask, xK_t), spawn "st")
        , ((mod4Mask, xK_x), kill)
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s -e 'mv $f ~/Pictures/screenshots/'" )
        , ((0, xK_Print), spawn "scrot")
        ]
        ++
        [((m .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f)) -- Replace 'mod1Mask' with your mod key of choice.
            | (key, sc) <- zip [xK_w, xK_e, xK_r] [1,0,2] -- was [0..] *** change to match your screen order ***
            , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

ws1GTD = "1:gtd"
ws2GEN = "2:gen"
ws3WRK = "3:wrk"
ws4WRK = "4:wrk"
ws5MY = "5:my"
ws6MY = "6:my"
ws7MUSIC = "7:music"
ws8MSG = "8:msg"
ws9MAIL = "9:mail"

myWorkspaces = [ws1GTD, ws2GEN, ws3WRK, ws4WRK, ws5MY, ws6MY, ws7MUSIC, ws8MSG, ws9MAIL]
myProjects :: [Project]
myProjects =
   [ Project { projectName = ws9MAIL
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws9MAIL "chromium-browser --new-window --app=https://www.fastmail.com"
                                            spawnOn ws9MAIL "chromium-browser --new-window --app=https://www.fastmail.com/calendar"
             },
     Project { projectName = ws1GTD
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws9MAIL "chromium-browser --new-window --app=https://www.trello.com"
             },
     Project { projectName = ws8MSG
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws8MSG "slack" },
     Project { projectName = ws7MUSIC
             , projectDirectory = "media/aurelienbottazini/Files/music"
             , projectStartHook = Just $ do spawnOn ws7MUSIC "spotify --force-device-scale-factor=2"
             }
   ]

myStartupHook = do
    setWMName "LG3D" -- workaround to make java swing windows work correctly. Without it they are just empty. For example Firefox -> file open.
    spawn "feh --bg-scale ~/Pictures/background.jpg"

noScratchPad ws = if ws == "NSP" then "" else ws

main :: IO()
main = do

    xmproc <- spawnPipe "xmobar"

    xmonad
        $ dynamicProjects myProjects
        $ docks
        $ def
        {
        manageHook = manageDocks <+> namedScratchpadManageHook scratchpads
        , modMask = mod4Mask
        , startupHook = myStartupHook
        , layoutHook = smartBorders $ avoidStruts $ mylayoutHook
        , terminal = "st"
        , focusedBorderColor = "#bc3e33"
        , normalBorderColor = "#c5c5c5"
        , borderWidth = 15
        , workspaces = myWorkspaces
        , focusFollowsMouse = myFocusFollowsMouse
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppCurrent = xmobarColor "#3a499c"  "" . wrap "[" "]"
                        -- , ppLayout = xmobarColor "#ffffff" ""
                        , ppLayout = const ""
                        , ppTitle = xmobarColor "#3a499c" "" . shorten 50
                        , ppHidden = noScratchPad
                        }
        } `additionalKeys` myKeys
