import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import XMonad.Layout.Gaps
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Maximize
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoFrillsDecoration

import XMonad.Actions.CycleWS

import System.IO

mySpacing = 2

mylayoutHook = maximize ((spacing mySpacing $ toggleLayouts (noBorders Full) (Tall 1 (3/100) (1/2)) ||| noBorders Full ||| noBorders (tabbed shrinkText def) |||  (spacing mySpacing $ Accordion)))
myFocusFollowsMouse = False
myKeys = [((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
	, ((mod4Mask, xK_o), swapNextScreen)
        , ((mod4Mask .|. controlMask, xK_Right), prevScreen)
	, ((mod4Mask .|. controlMask, xK_Left),  nextScreen)
	, ((mod4Mask .|. controlMask, xK_o),  shiftNextScreen)
	, ((mod4Mask, xK_m), withFocused (sendMessage . maximizeRestore))
	, ((mod4Mask, xK_u), spawn "amixer set Master 2+ unmute")
	, ((mod4Mask, xK_d), spawn "amixer set Master 2- unmute")
	, ((mod4Mask, xK_z), sendMessage ToggleLayout)
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
        ++
        [((m .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f)) -- Replace 'mod1Mask' with your mod key of choice.
            | (key, sc) <- zip [xK_w, xK_e, xK_r] [1,0,2] -- was [0..] *** change to match your screen order ***
            , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

main = do

    xmproc <- spawnPipe "xmobar"

    xmonad $ docks $ defaultConfig
        {
        manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ mylayoutHook
	, terminal = "urxvt"
	, focusedBorderColor = "#7ab1e8"
	, normalBorderColor = "#c5c5c5"
	, borderWidth = 10
	, focusFollowsMouse = myFocusFollowsMouse
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
				, ppCurrent = xmobarColor "#3a499c"  "" . wrap "[" "]"
					, ppTitle = xmobarColor "#bc3e33" "" . shorten 50
                        }
        } `additionalKeys` myKeys
