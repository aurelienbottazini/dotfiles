-- http://web.mit.edu/kevinr/Public/xmonad.hs
-- https://github.com/altercation/dotfiles-tilingwm/blob/master/.xmonad/xmonad.hs
-- https://github.com/windelicato/dotfiles/blob/master/.xmonad/xmonad.hs

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
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
import XMonad.Hooks.ICCCMFocus
import XMonad.Util.WorkspaceCompare
import XMonad.Actions.Navigation2D
import XMonad.Actions.WindowGo
import XMonad.Hooks.UrgencyHook
import XMonad.Util.NamedWindows
import XMonad.Util.Run
import XMonad.Actions.UpdatePointer
import XMonad.Actions.PhysicalScreens
import XMonad.Actions.CopyWindow

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
    ,(NS "htop" "st -c htop htop" (className =? "htop") (customFloating $ W.RationalRect (1/10) (1/10) (4/5) (4/5)))
    ,(NS "tig" "st -c tig tig" (className =? "tig") (customFloating $ W.RationalRect (1/10) (1/10) (4/5) (4/5)))
    ,(NS "spotify" "spotify --force-device-scale-factor=2 --role=spotify" (stringProperty "_NET_WM_NAME" =? "Spotify") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ]

mylayoutHook = toggleLayouts (noBorders $ tabbed shrinkText myTabTheme)
  $ spacing mySpacing $ (Tall 1 (3/100) (1/2)) ||| ThreeColMid 1 (2/20) (1/2)

myFocusFollowsMouse = False
myKeysP = [
        ("M-<Backspace>", kill)
        , ("M-S-p", spawn "scrot")
        , ("M-S-t", sendMessage ToggleStruts)
        , ("M1-<Space>", spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
        , ("M4-<ArrowDown", withFocused $ windows . W.sink)
        , ("M4--", spawn "amixer set Master 2- unmute")
        , ("M4-a e", runOrRaiseNext "st" (className =? "Emacs"))
        , ("M4-a t", runOrRaiseNext "st" (className =? "st-256color"))
        , ("M4-a w", runOrRaiseNext "st" (className =? "Firefox"))
        , ("M4-<Tab>" , nextNonEmptyWS)
        , ("M4-=", spawn "amixer set Master 2+ unmute")
        , ("M4-M1-o", swapNextScreen)
        , ("M4-[", sendMessage Shrink)
        , ("M4-\\",  toggleWS)
        , ("M4-]", sendMessage Expand)
        , ("M4-b",  prevNonEmptyWS)
        , ("M4-o",  windows W.focusUp)
        , ("M4-l",  windowGo R True)
        , ("M4-j",  windowGo D True)
        , ("M4-k",  windowGo U True)
        , ("M4-h",  windowGo L True)
        , ("M4-M1-l",  windowSwap R True)
        , ("M4-M1-j",  windowSwap D True)
        , ("M4-M1-k",  windowSwap U True)
        , ("M4-M1-w",  screenGo L True)
        , ("M4-M1-e",  screenGo R True)
        , ("M4-p", windows W.focusDown)
        , ("M4-s m", namedScratchpadAction scratchpads "cmus")
        , ("M4-s r", namedScratchpadAction scratchpads "ranger")
        , ("M4-s s", namedScratchpadAction scratchpads "shutter" )
        , ("M4-s v", namedScratchpadAction scratchpads "vlc")
        , ("M4-t a", toggleCopyToAll)
        , ("<XF86AudioMute>", spawn "amixer -q -D pulse sset Master toggle")
        , ("M4-z", sendMessage ToggleLayout)
        ]

myKeys = [
        -- kept as examples
        --
        -- , ((mod4Mask, xK_BackSpace), kill)
        -- , ((mod4Mask .|. shiftMask, xK_n),  prevNonEmptyWS)
        -- , ((mod4Mask .|. controlMask, xK_o), swapNextScreen)
        -- , ((mod4Mask, xK_minus), spawn "amixer set Master 2- unmute")
        -- , ((mod4Mask, xK_z), sendMessage ToggleLayout)
        -- , ((mod4Mask, xK_t), runOrRaiseNext "st" (className =? "st-256color"))
        ]
        ++
        [((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f)) -- Replace 'mod1Mask' with your mod key of choice.
            | (key, sc) <- zip [xK_w, xK_e, xK_r] [1,0,2] -- was [0..] *** change to match your screen order ***
            , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

toggleCopyToAll = wsContainingCopies >>= \ws -> case ws of
                                                  [] -> windows copyToAll
                                                  _ -> killAllOtherCopies
nextNonEmptyWS = findWorkspace getSortByIndexNoSP Next HiddenNonEmptyWS 1
        >>= \t -> (windows . W.view $ t)
prevNonEmptyWS = findWorkspace getSortByIndexNoSP Prev HiddenNonEmptyWS 1
        >>= \t -> (windows . W.view $ t)
getSortByIndexNoSP =
       fmap (.namedScratchpadFilterOutWorkspace) getSortByIndex

ws1GTD = "1:gtd"
ws2WWW = "2:www"
ws3SHARE = "3:share"
ws4CODE = "4:code"
ws5MY = "5:my"
ws6MY = "6:my"
ws7MUSIC = "7:music"
ws8MSG = "8:msg"
ws9MAIL = "9:mail"

myWorkspaces = [ws1GTD, ws2WWW, ws3SHARE, ws4CODE, ws5MY, ws6MY, ws7MUSIC, ws8MSG, ws9MAIL]
myProjects :: [Project]
myProjects =
   [
     Project { projectName = ws1GTD
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws1GTD "emacs ~/Dropbox/org/GTD.org"
             },
     Project { projectName = ws2WWW
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws2WWW "firefox"
             },
     Project { projectName = ws3SHARE
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws3SHARE "chromium-browser --new-window --app=https://tweetdeck.twitter.com"
                                            spawnOn ws3SHARE "chromium-browser --new-window --app=https://analytics.twitter.com"
             },
     Project { projectName = ws7MUSIC
             , projectDirectory = "media/aurelienbottazini/Files/music"
             , projectStartHook = Just $ do spawnOn ws7MUSIC "spotify --force-device-scale-factor=2"
             },
     Project { projectName = ws8MSG
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws8MSG "slack" },
     Project { projectName = ws9MAIL
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws9MAIL "chromium-browser --new-window --app=https://calendar.google.com/calendar/r?tab=mc"
                                            spawnOn ws9MAIL "chromium-browser --new-window --app=https://www.fastmail.com"
             }
   ]

myStartupHook = do
    -- https://wiki.haskell.org/Xmonad/Frequently_asked_questions#Problems_with_Java_applications.2C_Applet_java_console
    setWMName "LG3D" -- workaround to make java swing windows work correctly. Without it they are just empty. For example Firefox -> file open.
    spawn "xsetroot -cursor_name left_ptr"
    spawn "feh --bg-scale ~/Dropbox/Pictures/background.jpg"

noScratchPad ws = if ws == "NSP" then "" else ws

myNavigation2DConfig = def { layoutNavigation   = [("Full", centerNavigation), ("Spacing 7 Tall", centerNavigation)]
                           , unmappedWindowRect = [("Full", singleWindowRect)]
                           }

myLayoutPrinter :: String -> String
myLayoutPrinter "Spacing 7 ThreeCol" = "ThreeCol"
myLayoutPrinter "Spacing 7 Tall" = "Tall"
myLayoutPrinter x = x

main :: IO()
main = do

    xmproc <- spawnPipe "xmobar"

    xmonad
        $ withUrgencyHook LibNotifyUrgencyHook
        $ dynamicProjects myProjects
        $ docks
        $ withNavigation2DConfig myNavigation2DConfig
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
                        , ppLayout = myLayoutPrinter
                        , ppTitle = xmobarColor "#3a499c" "" . shorten 50
                        , ppHidden = noScratchPad
                        } >> updatePointer (0.5, 0.5) (0, 0) >> takeTopFocus
        } `additionalKeysP` myKeysP
          `additionalKeys` myKeys
