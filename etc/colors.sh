#!/bin/sh
# Dash printf sucks

# foreground black:  30
# foreground red:    31
# foreground green:  32
# foreground yellow: 33
# foreground blue:   34
# foreground purple: 35
# foreground cyan:   36
# foreground white:  37

# background black:  40
# background red:    41
# background green:  42
# background yellow: 43
# background blue:   44
# background purple: 45
# background cyan:   46
# background white:  47

# bold foreground: 1
# bold background: 5

while read c
do
  printf '%9s fg [\33[%bm██\33[m] bg [\33[%bm  \33[m]\n' "$c" "$c" "$c"
done <<+
30
30;41
30;42
30;43
30;44
30;45
30;46
30;47
31
31;41
31;42
31;43
31;44
31;45
31;46
31;47
32
32;41
32;42
32;43
32;44
32;45
32;46
32;47
33
33;41
33;42
33;43
33;44
33;45
33;46
33;47
34
34;41
34;42
34;43
34;44
34;45
34;46
34;47
35
35;41
35;42
35;43
35;44
35;45
35;46
35;47
36
36;41
36;42
36;43
36;44
36;45
36;46
36;47

41
42
43
44
45
46
47
1;30
1;30;41
1;30;42
1;30;43
1;30;44
1;30;45
1;30;46
1;30;47
1;31
1;31;41
1;31;42
1;31;43
1;31;44
1;31;45
1;31;46
1;31;47
1;32
1;32;41
1;32;42
1;32;43
1;32;44
1;32;45
1;32;46
1;32;47
1;33
1;33;41
1;33;42
1;33;43
1;33;44
1;33;45
1;33;46
1;33;47
1;34
1;34;41
1;34;42
1;34;43
1;34;44
1;34;45
1;34;46
1;34;47
1;35
1;35;41
1;35;42
1;35;43
1;35;44
1;35;45
1;35;46
1;35;47
1;36
1;36;41
1;36;42
1;36;43
1;36;44
1;36;45
1;36;46
1;36;47
1
1;41
1;42
1;43
1;44
1;45
1;46
1;47
5;30
5;30;41
5;30;42
5;30;43
5;30;44
5;30;45
5;30;46
5;30;47
5;31
5;31;41
5;31;42
5;31;43
5;31;44
5;31;45
5;31;46
5;31;47
5;32
5;32;41
5;32;42
5;32;43
5;32;44
5;32;45
5;32;46
5;32;47
5;33
5;33;41
5;33;42
5;33;43
5;33;44
5;33;45
5;33;46
5;33;47
5;34
5;34;41
5;34;42
5;34;43
5;34;44
5;34;45
5;34;46
5;34;47
5;35
5;35;41
5;35;42
5;35;43
5;35;44
5;35;45
5;35;46
5;35;47
5;36
5;36;41
5;36;42
5;36;43
5;36;44
5;36;45
5;36;46
5;36;47
5
5;41
5;42
5;43
5;44
5;45
5;46
5;47
1;5;30
1;5;30;41
1;5;30;42
1;5;30;43
1;5;30;44
1;5;30;45
1;5;30;46
1;5;30;47
1;5;31
1;5;31;41
1;5;31;42
1;5;31;43
1;5;31;44
1;5;31;45
1;5;31;46
1;5;31;47
1;5;32
1;5;32;41
1;5;32;42
1;5;32;43
1;5;32;44
1;5;32;45
1;5;32;46
1;5;32;47
1;5;33
1;5;33;41
1;5;33;42
1;5;33;43
1;5;33;44
1;5;33;45
1;5;33;46
1;5;33;47
1;5;34
1;5;34;41
1;5;34;42
1;5;34;43
1;5;34;44
1;5;34;45
1;5;34;46
1;5;34;47
1;5;35
1;5;35;41
1;5;35;42
1;5;35;43
1;5;35;44
1;5;35;45
1;5;35;46
1;5;35;47
1;5;36
1;5;36;41
1;5;36;42
1;5;36;43
1;5;36;44
1;5;36;45
1;5;36;46
1;5;36;47
1;5
1;5;41
1;5;42
1;5;43
1;5;44
1;5;45
1;5;46
1;5;47
+
