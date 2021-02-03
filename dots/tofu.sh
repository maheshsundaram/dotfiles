TODO="$HOME/notes/00-todo.txt"
DONE="$HOME/notes/04-done.txt"

tofu() {
  while test $# -gt 0; do
    case "$1" in
      -c|--clean)
        shift
        sort -o $TODO $TODO
        grep "^x " $TODO | sed -e 's/([A-Z]) //' >> $DONE
        sed -i '/^x /d' $TODO
        ;;
      -d|--due)
        shift
        # due today
        echo "# Done today"
        grep "x $(date +%F)" $DONE | \
          sed -E 's,^x ([0-9]{4})-([0-9]{2})-([0-9]{2}) ([0-9]{4})-([0-9]{2})-([0-9]{2}),,g' | \
          awk -F 'due:' '{print $1}' | \
          awk '{print "- [x]" $0}'
        echo ""

        echo "# Due today"
        grep "due:$(date +"%F")" $TODO | \
          # remove created date noise
          sed -E 's,(^[0-9]{4})-([0-9]{2})-([0-9]{2}),,g' | \
          awk -F 'due:' '{print $1}' | \
          awk '{print "- [ ]" $0}'
        ;;
      -o|--overdue)
        shift
        echo "# Overdue"
        grep "due:" $TODO | \
          sed -E 's,(^[0-9]{4})-([0-9]{2})-([0-9]{2}),,g' | \
          awk \
          -v today="$(date +"%F")" \
          -F 'due:' \
          '{
            split($2, subfield, " ");
            if (today > subfield[1])
              print "- [ ]" $0
          }'
        ;;
      -a|--add)
        shift
        echo "$(date +%F) $1" >> $TODO
        sort -o $TODO $TODO
        ;;
      -ctx|--contexts)
        shift
        # sed -i 's/^M//g' $TODO
        grep -o "[^ ]*@[^ ]\\+" $TODO | sed -n -e "/^@.*$/p" | sed "s///g" | sed "s/\@//g" | sort -u | fzf -m \
      --preview "f() { set -- \$(echo -- \$@); [ \$# -eq 0 ] || grep \$1 $TODO; }; f {}" \
      --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
                FZF-EOF" \
      --preview-window=right:60% \
      --height 100%
        # contexts=($(grep -o "[^ ]*@[^ ]\\+" $TODO | sed -n -e "/^@.*$/p" | sed "s///g" | sed "s/\@//g" | sort -u | fzf -m))
        # search=""
        # for i in ${!contexts[@]}
        # do
        #   count=`expr $i + 1`
        #   if [ $count -eq ${#contexts[@]} ]
        #   then
        #     search+="/${contexts[$i]}/"
        #   else
        #     search+="/${contexts[$i]}/ && "
        #   fi
        # done
        echo $search
        # awk '$search' $TODO
        # for c in ${ctx[*]}
        # do
        # done
        # xargs -I {} grep "{}" $TODO
        ;;
      -e|--edit)
        shift
        vim $TODO
        ;;
      *)
        break
        ;;
    esac
  done
}

# remove noise of created date
# sed -E 's,(^[0-9]{4})-([0-9]{2})-([0-9]{2}),,g'
# 
# # sort
# sort -o todo.txt todo.txt
# 
# # clean
# grep "^x " todo.txt >> todo.done.txt
# sed -i '/^x /d' todo.txt
# 
# # sort & clean should run before all other ops
# 
# # due today
# grep "due:$(date +%F)" todo.txt
# 
# # overdue
# grep "due:" todo.txt | awk \
#   -v today="$(date +"%F")" \
#   -F 'due:' \
#   '{
#     split($2, subfield, " ");
#     if (today > subfield[1]) print $0
#   }'
# 
# # agenda - overdue, due today
# grep "due:" todo.txt | awk \
#   -v today="$(date -d "tomorrow" +"%F")" \
#   -F 'due:' \
#   '{
#     split($2, subfield, " ");
#     if (today > subfield[1]) print $0
#   }'
# 
# # future agenda - due this week
# grep "due:" todo.txt | awk \
#   -v today="$(date +"%F")" \
#   -v next_week="$(date -d "next week" +"%F")" \
#   -F 'due:' \
#   '{
#     split($2, subfield, " ");
#     if (today < subfield[1] && subfield[1] < next_week) print $0
#   }'
# 
# # toggle done
# 
# # list all contexts
# 
# # list all tags
# 
# # list all tasks by context
# 
# # list all tasks by tag
# 
# # ---
# 
# # due today
# grep "due:$(date +"%F")" todo.txt | sed -E 's,(^[0-9]{4})-([0-9]{2})-([0-9]{2}),,g' | awk -F 'due:' '{printf("\n[ ]%-30s\n", $1)}'
