# Calculate Chi-squared value for test of independence

Null hypothesis: There is no significant difference in spelling error rate between three methods of list generation.
Alternate hypothesis: There is a significant difference.

## Expected values

expected = row total * column total / grand total

            Errors  Correct     Total
Direct      39.3    960.7       1000
Articles    39.3    960.7       1000
Translate   39.3    960.7       1000

## Actual values

            Errors  Correct     Total
Direct      35      965         1000
Articles    8       992         1000
Translate   75      925         1000
Total       118     2882        3000

## Chi-square

X^2 = Sum( (observed - expected)^2 / expected )

X^2 = (35-39.3)^2/39.3 + (8-39.3)^2/39.3 + (75-39.3)^2/39.3 + (965-960.7)^2/960.7 + (992-960.7)^2/960.7 + (925-960.7)^2/960.7
    = 0.47 + 24.93 + 32.43 + 0.02 + 1.02 + 1.33
    = 60.20

## Degrees of freedom

df = (rows - 1)(columns - 1)
   = (2)(1) 
   = 2

## p value

=CHISQ.DIST.RT(60.20, 2)
0.00000000000008467127

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
Direct      41.5    958.5       1000
Articles    41.5    958.5       1000

### Actual values

            Errors  Correct     Total
Articles    8       992         1000
Translate   75      925         1000
Total       83      1917        2000

## Chi-square

X^2 = Sum( (observed - expected)^2 / expected )

X^2 = (75-41.5)^2/41.5 + (8-41.5)^2/41.5 + (925-958.5)^2/958.5 + (992-958.5)^2/958.5
    = 27.04 + 27.04 + 1.17 + 1.17
    = 56.42

## Degrees of freedom

df = (rows - 1)(columns - 1)
   = (1)(1) 
   = 1

## p value

=CHISQ.DIST.RT(56.42, 1)
0.00000000000005853198

p < 0.0001