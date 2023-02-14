# Is this a problem?
# https://stackoverflow.com/questions/44679984/different-random-number-generation-between-os-in-r

set.seed(890458, kind="Mersenne-Twister", normal.kind="Inversion")
print(rlnorm(1504)[1504], digits=22)
sessionInfo()

gsub(" ","","3.14159 26535 89793 23846 26433")

as.numeric(gsub(" ","","3.14159 26535 89793 23846 26433"))
pi <- as.numeric(gsub(" ","","3.14159 26535 89793 23846 26433"))
# maximum number of digits that can be shown is 22
print(pi, digits=22)
