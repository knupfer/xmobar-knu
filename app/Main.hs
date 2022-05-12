import Xmobar

main :: IO ()
main = xmobar config

config :: Config
config = defaultConfig
  { font = "xft:DejaVu Sans Mono:size=11:bold"
  , bgColor = "black"
  , fgColor = "grey"
  , persistent = False
  , position = Top
  , border = NoBorder
  , borderColor = "#BFBFBF"
  , lowerOnStart = True
  , hideOnStart = False
  , commands =
    [ Run $ Date "%Y-%m-%d<fc=#00ffff>T</fc>%H:%M" "date" 100
    , Run $ Battery
      [ "--template" , "<acstatus>"
      , "--Low"      , "20"
      , "--High"     , "80"
      , "--low"      , "#ff5050"
      , "--normal"   , "#ddaa50"
      , "--high"     , "#50aaff"
      , "--"
      , "-o"         , "<fc=#777777>(<timeleft>)</fc> <left>%" -- discharging
      , "-O"         , "<fc=#ffff00>↯</fc> <left>%" -- charging
      , "-i"         , "<fc=#ffff00>↯</fc> <left>%" -- charged
      ] 5
    , Run $ MultiCpu ["--template", "<vbar0><vbar1><vbar2><vbar3>" ] 3
    , Run $ Volume "default" "Master" [] 3
    , Run $ Weather "EDDS" ["-t", "<tempC>°C"] 36000
    , Run $ Memory [ "--template", "Mem: <usedratio>%"
                   , "-L"       , "33"
                   , "-H"       , "66"
                   , "--low"    , "green"
                   , "--normal" , "yellow"
                   , "--high"   , "red"
                   ] 3
    , Run $ XMonadLog
    ]
  , sepChar = "%"
  , alignSep = "}{"
  , template = "%default:Master%| %memory% | %XMonadLog% }{%multicpu% | %battery% | %EDDS% %date%"
}

