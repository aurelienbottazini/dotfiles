-- Reference files:
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
import XMonad.Layout.Accordion
import XMonad.Layout.Grid
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
import XMonad.Actions.UpdatePointer
import XMonad.Actions.CopyWindow
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.WithAll
import XMonad.Layout.NoFrillsDecoration
import XMonad.Hooks.ManageHelpers

import qualified XMonad.StackSet as W

data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)
instance UrgencyHook LibNotifyUrgencyHook where
    urgencyHook LibNotifyUrgencyHook w = do
        windowName     <- getName w
        Just idx <- fmap (W.findTag w) $ gets windowset

        safeSpawn "notify-send" [show windowName, "workspace " ++ idx]

mySpacing :: Int
mySpacing = 7

myTabTheme :: Theme
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

-- Scratchpads are windows I can hide / show on demand. When Hidden
-- they are waiting on a special scratchpad workspace. When shown they
-- are displayed on the current workspace
scratchpads :: [NamedScratchpad]
scratchpads =
    [(NS "cmus" "st -c cmus cmus" (className =? "cmus") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "tranmission" "transmission-gtk" (className =? "Transmission-gtk") (customFloating $ W.RationalRect (1/5) (1/5) (2/5) (2/5)))
    ,(NS "youtube-music" "chromium-browser --new-window --app=https://music.youtube.com" (resource =? "music.youtube.com") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "peek" "peek" (className =? "Peek") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "vlc" "vlc" (className =? "vlc") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "ranger" "st -c term-ranger ranger" (className =? "term-ranger") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "global-org-capture"  "emacsclient -ca \"\" --frame-parameters='(quote (name . \"global-org-capture\"))' -e '(org-capture nil \"g\")'" (appName =? "global-org-capture") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "settings" "launch-settings.sh" (className =? "Gnome-control-center") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "bluetooth" "blueman-manager" (className =? "Blueman-manager") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    -- resource is used to match the first component of the WM_NAME property
    ,(NS "calendar" "chromium-browser --new-window --app=http://calendar.google.com" (resource =? "calendar.google.com") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "email" "chromium-browser --new-window --app=https://www.fastmail.com" (resource =? "www.fastmail.com") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "worldtimebuddy" "chromium-browser --new-window --app=https://www.worldtimebuddy.com" (resource =? "www.worldtimebuddy.com") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "gsimplecal" "gsimplecal" (className =? "Gsimplecal") (customFloating $ W.RationalRect (4/5) (1/40) (1/5) (1/5)))
    ,(NS "GTD" "emacs --name gtdEmacs ~/Dropbox/org/GTD.org" (resource =? "gtdEmacs") (defaultFloating))
    -- ,(NS "GTD" "emacs --name gtdEmacs ~/Dropbox/org/GTD.org" (resource =? "gtdEmacs") (customFloating $ W.RationalRect (0) (1/40) (1/2) (6/10)))
    ] -- where role = stringProperty "WM_WINDOW_ROLE"

-- I have two variables to hold my bindings: myKeysP and myKeys.
-- They use a different syntax and the two are combined in my config.
-- Sometimes I prefer a syntax over another that's why I keep the two.

-- memo
-- default config: https://github.com/xmonad/xmonad/blob/master/src/XMonad/Config.hs
-- M4-ret = swap master
-- M4-, = increase number of windows in master area
-- M4-. = decrease number of windows in master area
-- M4-S-/ = show default keybindings
myKeysP :: [(String, X ())]
myKeysP = [
        ("M-<Backspace>", kill)
        , ("<XF86AudioLowerVolume>", spawn "pulseaudio-rofi.sh --volume_down")
        , ("<XF86AudioMute>", spawn "pulseaudio-rofi.sh --mute")
        , ("<XF86AudioRaiseVolume>", spawn "pulseaudio-rofi.sh --volume_up")
        , ("<XF86MonBrightnessDown>", spawn "lux -s 10%")
        , ("<XF86MonBrightnessUp>", spawn "lux -a 10%")
        , ("M4-<Space> <Space>", spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
        , ("M4-<Space> <Return>", namedScratchpadAction scratchpads "global-org-capture")
        , ("M4-<Space> r", spawn "dmenu-yes-no.sh \"Do you want to reboot?\" \"reboot.sh\"")
        , ("M4-<Space> u", spawn "dmenu-unicode.sh")
        , ("M4-<Space> x", spawn "dmenu-yes-no.sh \"Do you want to shutdown?\" \"shutdown.sh\"")
        , ("M4-<Space> s", spawn "flameshot gui")
        , ("M4-<Space> p", spawn "peek")
        , ("M4-<Tab>" , nextNonEmptyWS)
        , ("M4-S-<Backspace>", killAll)
        , ("M4-[", sendMessage Shrink)
        , ("M4-]", sendMessage Expand)
        , ("M4-\\",  toggleWS)
        , ("M4-c", runOrRaiseNext "mainEmacs.sh" (resource =? "mainEmacs"))
        , ("M4-b", runOrRaiseNext "chromium-browser --new-window" (resource =? "chromium-browser"))
        , ("M4-i", runOrRaiseNext "idea" (className =? "jetbrains-idea"))
        , ("M4-v", runOrRaiseNext "st" (className =? "st-256color"))
        , ("M4-h",  windowGo L True)
        , ("M4-n",  windows W.focusUp)
        , ("M4-p",  windows W.focusDown)
        , ("M4-j",  windowGo D True)
        , ("M4-k",  windowGo U True)
        , ("M4-l",  windowGo R True)
        , ("M4-S-h",  windowSwap L True)
        , ("M4-S-j",  windowSwap D True)
        , ("M4-S-k",  windowSwap U True)
        , ("M4-S-l",  windowSwap R True)
        , ("M4-m e",  screenGo R True)
        , ("M4-m s", swapNextScreen)
        , ("M4-m w",  screenGo L True)
        , ("M4-o l", sendMessage NextLayout)
        , ("M4-o s", withFocused $ windows . W.sink)
        , ("M4-o t", sendMessage ToggleStruts)
        , ("M4-s S-m", namedScratchpadAction scratchpads "cmus")
        , ("M4-s c", namedScratchpadAction scratchpads "calendar")
        , ("M4-s e", namedScratchpadAction scratchpads "email")
        , ("M4-s g", namedScratchpadAction scratchpads "GTD")
        , ("M4-s m", namedScratchpadAction scratchpads "youtube-music")
        , ("M4-f", namedScratchpadAction scratchpads "ranger")
        , ("M4-s v", namedScratchpadAction scratchpads "vlc")
        , ("M4-t a", toggleCopyToAll)
        , ("M4-t s", spawn "gnome-screensaver-command -l")
        , ("M4-z", sendMessage ToggleLayout)
        ]

myKeys :: [((KeyMask, KeySym), X ())]
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
            | (key, sc) <- zip [xK_w, xK_e, xK_r] [0,1,2] -- was [0..] *** change to match your screen order ***
            , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

toggleCopyToAll :: X ()
toggleCopyToAll = wsContainingCopies >>= \ws -> case ws of
                                                  [] -> windows copyToAll
                                                  _ -> killAllOtherCopies

nextNonEmptyWS :: X ()
nextNonEmptyWS = findWorkspace getSortByIndexNoSP Next HiddenNonEmptyWS 1
        >>= \t -> (windows . W.view $ t)

prevNonEmptyWS :: X ()
prevNonEmptyWS = findWorkspace getSortByIndexNoSP Prev HiddenNonEmptyWS 1
        >>= \t -> (windows . W.view $ t)

getSortByIndexNoSP :: X([WindowSpace] -> [WindowSpace])
getSortByIndexNoSP =
       fmap (.namedScratchpadFilterOutWorkspace) getSortByIndex

ws1GTD :: String
ws1GTD = "1:gtd"
ws2WWW :: String
ws2WWW = "2:www"
ws3TRAINING :: String
ws3TRAINING = "3:training"
ws4TALK :: String
ws4TALK = "4:talk"
ws5EMACS :: String
ws5EMACS = "5:emacs"
ws6MY :: String
ws6MY = "6:my"
ws7MY :: String
ws7MY = "7:my"
ws8MSG :: String
ws8MSG = "8:my"
ws9MAIL :: String
ws9MAIL = "9:mail"

myWorkspaces :: [String]
myWorkspaces = [ws1GTD, ws2WWW, ws3TRAINING, ws4TALK, ws5EMACS, ws6MY, ws7MY, ws8MSG, ws9MAIL]

myProjects :: [Project]
-- Projects are predefined workspace. When you switch to a workspace
-- and that workspace is empty, the preconfigured windows are launched / created.
myProjects =
   [
     Project { projectName = ws1GTD
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws1GTD "st"

             },
     Project { projectName = ws2WWW
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws2WWW "chromium-browser"
             },
     Project { projectName = ws3TRAINING
             , projectDirectory = "~/projects/training-heaven"
             , projectStartHook = Just $ do spawnOn ws3TRAINING "anki"
             },
     -- Project { projectName = ws7MY
     --         , projectDirectory = "media/aurelienbottazini/Files/music"
     --         , projectStartHook = Just $ do spawnOn ws7MY "spotify --force-device-scale-factor=2"
     --         },
     Project { projectName = ws4TALK
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws4TALK "slack" },
     Project { projectName = ws5EMACS
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws5EMACS "emacs" }
     -- Project { projectName = ws9MAIL
     --         , projectDirectory = "~/"
     --         , projectStartHook = Just $ do spawnOn ws9MAIL "chromium-browser --new-window --app=https://calendar.google.com/calendar/r?tab=mc"
     --                                        spawnOn ws9MAIL "chromium-browser --new-window --app=https://www.fastmail.com"
     --         }
   ]

myStartupHook :: X ()
myStartupHook = do
    -- https://wiki.haskell.org/Xmonad/Frequently_asked_questions#Problems_with_Java_applications.2C_Applet_java_console
    setWMName "LG3D" -- workaround to make java swing windows work correctly. Without it they are just empty. For example Firefox -> file open.
    spawn "compton -CG --active-opacity 1.0 --shadow-ignore-shaped"
    spawn "xsetroot -cursor_name left_ptr"
    spawn "feh --bg-fill ~/Dropbox/Pictures/wallpaper/jonny-caspari-1148431-unsplash.jpg"

noScratchPad :: String -> String
noScratchPad ws = if ws == "NSP" then "" else ws

myNavigation2DConfig :: Navigation2DConfig
myNavigation2DConfig = def { layoutNavigation   = [("Full", centerNavigation), ("Spacing 7 Tall", centerNavigation)]
                           , unmappedWindowRect = [("Full", singleWindowRect)]
                           }

myLayoutPrinter :: String -> String
myLayoutPrinter "NoFrillsDeco Spacing 7 ThreeCol" = " ThreeCol "
myLayoutPrinter "NoFrillsDeco Spacing 7 Tall" = " Tall "
myLayoutPrinter "NoFrillsDeco Spacing 7 Accordion" = " Accordion "
myLayoutPrinter "NoFrillsDeco Spacing 7 Grid" = " Grid "
myLayoutPrinter "Tabbed Simplest" = " Simplest "
myLayoutPrinter x = x

topBarTheme :: Theme
topBarTheme = def
    { fontName              =  "xft:Gotham HTF Black:size=12"
    , inactiveBorderColor   = "#002b36"
    , inactiveColor         = "#002b36"
    , inactiveTextColor     = "#002b36"
    , activeBorderColor     = "#fccf61"
    , activeColor           = "#fccf61"
    , activeTextColor       = "#fccf61"
    , urgentBorderColor     = "#bc3e44"
    , urgentTextColor       = "#000000"
    , decoHeight            = 20
    }

myLayoutHook = avoidStruts
               $ toggleLayouts (noBorders $ tabbed shrinkText myTabTheme)
               $ addTopBar
               $ spacing mySpacing
               $ smartBorders
               $ (Tall 1 (3/100) (1/2)) ||| ThreeColMid 1 (2/20) (1/2) ||| Accordion ||| Grid

addTopBar = noFrillsDeco shrinkText topBarTheme

myManageHook :: ManageHook
myManageHook = manageDocks <+> namedScratchpadManageHook scratchpads
  <+> (composeAll . concat $
      [[className    =? c            --> doCenterFloat       |   c   <- myFloats ]
      ]
    ) where myFloats  = ["Nautilus"]

main :: IO()
main = do

    xmproc <- spawnPipe "xmobar"

    xmonad
        $ ewmh
        $ withUrgencyHook LibNotifyUrgencyHook
        $ dynamicProjects myProjects
        $ docks
        $ withNavigation2DConfig myNavigation2DConfig
        $ def
        {
          handleEventHook =
            handleEventHook def <+> fullscreenEventHook,
          manageHook = myManageHook
        , modMask = mod4Mask
        , startupHook = myStartupHook
        , layoutHook = myLayoutHook
        , terminal = "st"
        , focusedBorderColor = "#bc3e33"
        , normalBorderColor = "#c5c5c5"
        , borderWidth = 0
        , workspaces = myWorkspaces
        , focusFollowsMouse = False
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppCurrent = xmobarColor "#ffffff"  "#bc3e33" . wrap " [" "] "
                        , ppLayout = xmobarColor "#ffffff" "#65428a" . myLayoutPrinter
                        , ppTitle = xmobarColor "#000000" "#fccf61" . shorten 50 . wrap " " " "
                        , ppHidden = noScratchPad
                        } >> updatePointer (0.5, 0.5) (0, 0)
        } `additionalKeysP` myKeysP
          `additionalKeys` myKeys
