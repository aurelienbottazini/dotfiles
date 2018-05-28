-- http://web.mit.edu/kevinr/Public/xmonad.hs
-- https://github.com/altercation/dotfiles-tilingwm/blob/master/.xmonad/xmonad.hs

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.ThreeColumns
import XMonad.Util.NamedScratchpad
import XMonad.Actions.CycleWS
import XMonad.Actions.DynamicProjects
import XMonad.Actions.SpawnOn
import XMonad.Hooks.SetWMName
import XMonad.Util.WorkspaceCompare
import XMonad.Actions.Navigation2D
import XMonad.Actions.WindowGo
import XMonad.Hooks.UrgencyHook
import XMonad.Util.NamedWindows
import XMonad.Util.Run

import qualified XMonad.StackSet as W

import System.IO

data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)
instance UrgencyHook LibNotifyUrgencyHook where
    urgencyHook LibNotifyUrgencyHook w = do
        name     <- getName w
        Just idx <- fmap (W.findTag w) $ gets windowset

        safeSpawn "notify-send" [show name, "workspace " ++ idx]
mySpacing = 7

myTabTheme = def {
  fontName = "xft:Gotham HTF Black:size=12",
  decoHeight = 40,
  activeColor = "#fccf61",
  activeBorderColor = "#fccf61",
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
    ,(NS "shutter" "shutter" (className =? "Shutter") (customFloating $ W.RationalRect (1/10) (1/10) (4/5) (4/5)))
    ,(NS "spotify" "spotify --force-device-scale-factor=2 --role=spotify" (stringProperty "_NET_WM_NAME" =? "Spotify") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ]

mylayoutHook = toggleLayouts (noBorders $ tabbed shrinkText myTabTheme)
  $ spacing mySpacing $ (Tall 1 (3/100) (1/2)) ||| ThreeColMid 1 (2/20) (1/2)
myFocusFollowsMouse = False
myKeys = [((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
         , ((mod4Mask .|. shiftMask, xK_t), sendMessage ToggleStruts)
         , ((mod4Mask, xK_r), namedScratchpadAction scratchpads "ranger")
         , ((mod4Mask, xK_s), namedScratchpadAction scratchpads "cmus")
        , ((mod4Mask, xK_v), namedScratchpadAction scratchpads "vlc")
        , ((mod4Mask, xK_b), runOrRaiseNext "firefox" (className =? "Firefox"))
        , ((mod4Mask, xK_m), runOrRaiseNext "emacs" (className =? "Emacs"))
        , ((controlMask, xK_Print), namedScratchpadAction scratchpads "shutter" )
        , ((0, xK_Print), spawn "scrot")

        , ((mod4Mask, xK_l), windows W.focusDown)
        , ((mod4Mask, xK_h), windows W.focusUp)
        -- , ((mod4Mask, xK_k), windowGo U True)
        -- , ((mod4Mask, xK_j), windowGo D True)

        , ((mod4Mask, xK_bracketleft), sendMessage Shrink)
        , ((mod4Mask, xK_bracketright), sendMessage Expand)

        , ((mod1Mask, xK_space), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")

        , ((mod4Mask, xK_BackSpace), kill)
        , ((mod4Mask .|. controlMask, xK_backslash), swapNextScreen)
        , ((mod4Mask, xK_backslash),  toggleWS)
        , ((mod4Mask, xK_i),  prevNonEmptyWS)
        , ((mod4Mask, xK_o),  nextNonEmptyWS)
        , ((mod4Mask, xK_equal), spawn "amixer set Master 2+ unmute")
        , ((mod4Mask, xK_minus), spawn "amixer set Master 2- unmute")
        , ((mod4Mask, xK_z), sendMessage ToggleLayout)
        , ((mod4Mask, xK_t), runOrRaiseNext "st" (className =? "st-256color"))
        ]
        ++
        [((m .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f)) -- Replace 'mod1Mask' with your mod key of choice.
            | (key, sc) <- zip [xK_w, xK_e, xK_r] [1,0,2] -- was [0..] *** change to match your screen order ***
            , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

nextNonEmptyWS = findWorkspace getSortByIndexNoSP Next HiddenNonEmptyWS 1
        >>= \t -> (windows . W.view $ t)
prevNonEmptyWS = findWorkspace getSortByIndexNoSP Prev HiddenNonEmptyWS 1
        >>= \t -> (windows . W.view $ t)
getSortByIndexNoSP =
       fmap (.namedScratchpadFilterOutWorkspace) getSortByIndex

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
             , projectStartHook = Just $ do spawnOn ws9MAIL "chromium-browser --new-window --app=https://calendar.google.com/calendar/r?tab=mc"
                                            spawnOn ws9MAIL "chromium-browser --new-window --app=https://www.fastmail.com"
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
    spawn "xsetroot -cursor_name left_ptr"
    spawn "feh --bg-scale ~/Dropbox/Pictures/background.jpg"
    -- spawn "xrandr --dpi 183 --fb 7860x4320 --output HDMI-3 --primary --mode 3840x2160 --pos 3840x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output HDMI-2 --mode 1920x1080 --scale 2x2 --pos 0x0 --rotate normal"

noScratchPad ws = if ws == "NSP" then "" else ws

main :: IO()
main = do

    xmproc <- spawnPipe "xmobar"

    xmonad
        $ withUrgencyHook LibNotifyUrgencyHook
        $ dynamicProjects myProjects
        $ docks
        $ withNavigation2DConfig def
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
                        , ppCurrent = xmobarColor "#000000"  "#fccf61" . wrap "[" "]"
                        -- , ppLayout = xmobarColor "#ffffff" ""
                        , ppLayout = const ""
                        , ppTitle = xmobarColor "#3a499c" "" . shorten 50
                        , ppHidden = noScratchPad
                        }
        } `additionalKeys` myKeys
