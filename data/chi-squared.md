# Calculate Chi-squared value for test of independence

Null hypothesis: There is no significant difference in spelling error rate between three methods of list generation.
Alternate hypothesis: There is a significant difference.

## Expected values

expected = row total * column total / grand total

            Errors  Correct     Total
Direct      40      960         1000
Articles    40      960         1000
Translate   40      960         1000

## Actual values

            Errors  Correct     Total
Direct      35      965         1000
Articles    8       992         1000
Translate   77      923         1000
Total       120     2880        3000

## Chi-square

X^2 = Sum( (observed - expected)^2 / expected )

X^2 = (35-40)^2/40 + (8-40)^2/40 + (77-40)^2/40 + (965-960)^2/960 + (992-960)^2/960 + (923-960)^2/960
    = 0.625 + 25.6 + 34.225 + 0.026 + 1.067 + 1.426
    = 62.969 

## Degrees of freedom

df = (rows - 1)(columns - 1)
   = (2)(1) 
   = 2

## p value

=CHISQ.DIST.RT(63, 2)
0.00000000000002087968
p < 0.0001


## Pairwise comparison of Direct and article

### Expected values

expected = row total * column total / grand total

            Errors  Correct     Total
Direct      21.5    978.5       1000
Articles    21.5    978.5       1000

### Actual values

            Errors  Correct     Total
Direct      35      965         1000
Articles    8       992         1000
Total       43      1957        2000

## Chi-square

X^2 = Sum( (observed - expected)^2 / expected )

X^2 = (35-21.5)^2/21.5 + (8-21.5)^2/21.5 + (965-978.5)^2/978.5 + (992-978.5)^2/978.5
    = 8.48 + 8.48 + 0.19 + 0.19
    = 17.34

## Degrees of freedom

df = (rows - 1)(columns - 1)
   = (1)(1) 
   = 1

## p value

=CHISQ.DIST.RT(17.34, 1)
0.0000312538499481505

p < 0.0001

## Pairwise comparison of Translation and article

### Expected values

expected = row total * column total / grand total

            Errors  Correct     Total
Direct      42.5    957.5       1000
Articles    42.5    957.5       1000

### Actual values

            Errors  Correct     Total
Articles    8       992         1000
Translate   77      923         1000
Total       85      1915        2000

## Chi-square

X^2 = Sum( (observed - expected)^2 / expected )

X^2 = (77-42.5)^2/42.5 + (8-42.5)^2/42.5 + (923-957.5)^2/957.5 + (992-957.5)^2/957.5
    = 28.01 + 28.01 + 1.24 + 1.24
    = 58.5

## Degrees of freedom

df = (rows - 1)(columns - 1)
   = (1)(1) 
   = 1

## p value

=CHISQ.DIST.RT(58.5, 1)
0.00000000000002032909
p < 0.0001