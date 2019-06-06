-- Reference files:
-- http://web.mit.edu/kevinr/Public/xmonad.hs
-- https://github.com/altercation/dotfiles-tilingwm/blob/master/.xmonad/xmonad.hs
-- https://github.com/windelicato/dotfiles/blob/master/.xmonad/xmonad.hs

import XMonad hiding ( (|||) )  -- don't use the normal ||| operator
import XMonad.Layout.LayoutCombinators   -- use the one from LayoutCombinators instead
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.ThreeColumns
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
    [
    (NS "tranmission" "transmission-gtk" (className =? "Transmission-gtk") (customFloating $ W.RationalRect (1/5) (1/5) (2/5) (2/5)))
    ,(NS "youtube-music" "chromium --new-window --app=https://music.youtube.com" (resource =? "music.youtube.com") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "peek" "peek" (className =? "Peek") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "vlc" "vlc" (className =? "vlc") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "midnight-commander" "st -c term-mc -e mc --nosubshell" (className =? "term-mc") (customFloating $ W.RationalRect (1/10) (1/10) (4/5) (4/5)))
    ,(NS "gtd-org-capture"  "emacsclient -ca \"\" --frame-parameters='(quote (name . \"global-org-capture\"))' -e '(org-capture nil \"g\")'" (appName =? "global-org-capture") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "tdd-org-capture"  "emacsclient -ca \"\" --frame-parameters='(quote (name . \"global-org-capture\"))' -e '(org-capture nil \"t\")'" (appName =? "global-org-capture") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "calendar" "chromium --new-window --app=http://calendar.google.com" (resource =? "calendar.google.com") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "email" "chromium --new-window --app=https://www.fastmail.com" (resource =? "www.fastmail.com") (customFloating $ W.RationalRect (1/2) (0) (1/2) (1)))
    ,(NS "scratch-term" "st -c scratch-term fortune" (className =? "scratch-term") (customFloating $ W.RationalRect (1/2) (0) (1/2) (1)))
    ,(NS "worldtimebuddy" "chromium --new-window --app=https://www.worldtimebuddy.com" (resource =? "www.worldtimebuddy.com") (customFloating $ W.RationalRect (1/5) (1/5) (3/5) (3/5)))
    ,(NS "GTD" "emacs --name gtdEmacs ~/Dropbox/org/GTD.org" (resource =? "gtdEmacs") (customFloating $ W.RationalRect (0) (0) (1/2) (1)))
    ,(NS "TDD" "emacs --name tddEmacs ~/Dropbox/org/tdd.org" (resource =? "tddEmacs") (customFloating $ W.RationalRect (0) (0) (1/2) (1)))
    ,(NS "vscode" "code" (className =? "Code") (customFloating $ W.RationalRect (1/2) (0) (1/2) (1)))
    ,(NS "jetbrains-toolbox"  "jetbrains-toolbox" (className =? "jetbrains-toolbox") (customFloating $ W.RationalRect (0/5) (1/5) (3/5) (3/5)))
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
        , ("<F4>", kill)
        , ("M4-<Space> t", namedScratchpadAction scratchpads "tdd-org-capture")
        , ("M4-<Space> c", namedScratchpadAction scratchpads "vscode")
        , ("M4-<Space> r", spawn "dmenu-yes-no.sh \"Do you want to reboot?\" \"reboot.sh\"")
        , ("M4-<Space> x", spawn "dmenu-yes-no.sh \"Do you want to shutdown?\" \"shutdown.sh\"")
        , ("M4-<Tab>" , nextNonEmptyWS)
        , ("M4-S-<Backspace>", killAll)
        , ("M4-[", sendMessage Shrink)
        , ("M4-]", sendMessage Expand)
        , ("M4-\\",  toggleWS)
        , ("M4-h",  windowGo L True)
        , ("M4-j",  windowGo D True)
        , ("M4-g",  sendMessage $ JumpToLayout "Grid")
        , ("M4-v",  sendMessage $ JumpToLayout "Tall")
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
        , ("M4-s c", namedScratchpadAction scratchpads "calendar")
        , ("M4-s e", namedScratchpadAction scratchpads "email")
        , ("M4-s g", namedScratchpadAction scratchpads "GTD")
        , ("M4-s t", namedScratchpadAction scratchpads "TDD")
        , ("M4-s S-m", namedScratchpadAction scratchpads "youtube-music")
        , ("M4-s v", namedScratchpadAction scratchpads "vlc")
        , ("M4-o a", toggleCopyToAll)
        , ("M4-z", sendMessage ToggleLayout <+> sendMessage ToggleStruts)
        , ("<F11>", sendMessage ToggleLayout <+> sendMessage ToggleStruts)
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

ws1TERM :: String
ws1TERM = "1:term"
ws2WWW :: String
ws2WWW = "2:www"
ws3CODE :: String
ws3CODE = "3:Code"
ws4TALK :: String
ws4TALK = "4:talk"
ws5TOOLS :: String
ws5TOOLS = "5:tools"
ws6TRAINING :: String
ws6TRAINING = "6:training"
ws7MY :: String
ws7MY = "7:my"
ws8MSG :: String
ws8MSG = "8:my"
ws9MAIL :: String
ws9MAIL = "9:mail"

myWorkspaces :: [String]
myWorkspaces = [ws1TERM, ws2WWW, ws3CODE, ws4TALK, ws5TOOLS, ws6TRAINING, ws7MY, ws8MSG, ws9MAIL]

myProjects :: [Project]
-- Projects are predefined workspace. When you switch to a workspace
-- and that workspace is empty, the preconfigured windows are launched / created.
myProjects =
   [
     Project { projectName = ws1TERM
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws1TERM "st"

     },
     Project { projectName = ws2WWW
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws2WWW "chromium"
     },
     -- Project { projectName = ws3CODE
     --         , projectDirectory = "~/"
     -- },
     Project { projectName = ws4TALK
             , projectDirectory = "~/"
             , projectStartHook = Just $ do spawnOn ws4TALK "slack"
     },
     Project { projectName = ws5TOOLS
             , projectDirectory = "~/projects"
             , projectStartHook = Just $ do spawnOn ws5TOOLS "datagrip"
     },
     Project { projectName = ws6TRAINING
             , projectDirectory = "~/projects/training-heaven"
             , projectStartHook = Just $ do spawnOn ws6TRAINING "anki"
     }
   ]

myStartupHook :: X ()
myStartupHook = do
    -- https://wiki.haskell.org/Xmonad/Frequently_asked_questions#Problems_with_Java_applications.2C_Applet_java_console
    setWMName "LG3D" -- workaround to make java swing windows work correctly. Without it they are just empty. For example Firefox -> file open.
    spawn "compton -CG --active-opacity 1.0 --shadow-ignore-shaped"
    spawn "xsetroot -cursor_name left_ptr"
    spawn "feh --bg-fill  ~/Dropbox/Pictures/wallpaper/ps21_16x20.jpg"
    spawn "setxkbmap -option ctrl:nocaps"

noScratchPad :: String -> String
noScratchPad ws = if ws == "NSP" then "" else ws

myNavigation2DConfig :: Navigation2DConfig
myNavigation2DConfig = def { layoutNavigation   = [("NoFrillsDeco Spacing Grid", hybridNavigation), ("NoFrillsDeco Spacing Tall", hybridNavigation), ("Full", hybridNavigation)]
                           , unmappedWindowRect = [("Full", singleWindowRect)]
                           }

myLayoutPrinter :: String -> String
myLayoutPrinter "NoFrillsDeco Spacing ThreeCol" = " ThreeCol "
myLayoutPrinter "NoFrillsDeco Spacing Tall" = " Tall "
myLayoutPrinter "NoFrillsDeco Spacing Grid" = " Grid "
myLayoutPrinter "NoFrillsDeco Spacing Full" = " Full "
myLayoutPrinter "Tabbed Simplest" = " Simplest "
myLayoutPrinter "Full" = " Full "
myLayoutPrinter x = x

topBarTheme :: Theme
topBarTheme = def
    { fontName              =  "xft:Operator Mono:size=12"
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

mySpacing = 7

myLayoutHook = avoidStruts
               -- $ toggleLayouts (noBorders $ tabbed shrinkText myTabTheme)
               $ toggleLayouts (noBorders $ Full)
               $ addTopBar
               $ spacingRaw True (Border 0 7 7 7) True (Border 7 7 7 7) True
               $ smartBorders (Tall 1 (3/100) (1/2)) ||| ThreeColMid 1 (2/20) (1/2) ||| Grid

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
        $ ewmh defaultConfig
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
