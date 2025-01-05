awk '

{ s += $2; x[NR] = $2; dist[int($2/2000)]++ }



END {

  for (i = NR-6; i <= NR; i++) w += x[i]

  for (i = NR-30; i <= NR; i++) m += x[i]

  for (i = NR-90; i <= NR; i++) q += x[i]

  for (i = NR-365; i <= NR; i++) yr += x[i]

  printf("  7: %.0f  30: %.0f  90: %.0f  1yr: %.0f  %.1fyr: %.0f\n",

    w/7, m/30, q/90, yr/365, NR/365, s/NR)



  scale = 1

  for (i = 1; i <= 10; i++) {

    printf("%5d: ", i*2000)

    for (j = 0; j < scale * dist[i]; j++)

      printf("*")

    printf("\n")

  }

} ' $*