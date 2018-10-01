function tail-notify
   tail -fn0 README.md | grep --line-buffered "foo" | while read -la line
     notify-send "CURRENT LOGIN" $line -t 3000
   end
end