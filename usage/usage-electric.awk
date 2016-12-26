#!/usr/bin/awk --file
BEGIN {
  FS = ","
  z["2015 05"] =  417
  z["2015 04"] =  457
  z["2015 03"] =  940
  z["2015 02"] = 1282
  z["2015 01"] = 1308
  z["2014 12"] = 1216
  z["2014 11"] = 1115
  z["2014 10"] =  611
  z["2014 09"] =  778
  z["2014 08"] = 1035
  z["2014 07"] =  954
  z["2014 06"] =  861

  # exclude company
  # y["4CHANGE ENERGY"]

  # exclude plan
  # x["Gexa Choice Conserve 5"]
}
NR == 1 {
  while (q++ < NF) {
    w[$q] = q
  }
}
$w["Rate Type"] == "Fixed" {
  for (q in y)
    if ($w["RepCompany"] == q) {
      next
    }
  for (q in x)
    if ($w["Plan Name"] == q) {
      next
    }
  tot = 0
  for (q in z)
    if (z[q] >= 1000)
      tot += $w["Price/kWh 1000"] * z[q]
    else {
      tot += $w["Price/kWh 500"] * z[q]
    }
  v[NR, 1] = tot
  v[NR, 2] = $w["RepCompany"]
  v[NR, 3] = $w["Price/kWh 500"]
  v[NR, 4] = $w["Price/kWh 1000"]
}
END {
  for (q = 2; q <= NR; q++) {
    printf "$%.0f - %s - 500 kWh %s - 1000 kWh %s\n",
    v[q, 1], v[q, 2], v[q, 3], v[q, 4]
  }
}
