#!/usr/bin/awk -f
BEGIN {
  FS = ","
  br["2015 05"] =  417
  br["2015 04"] =  457
  br["2015 03"] =  940
  br["2015 02"] = 1282
  br["2015 01"] = 1308
  br["2014 12"] = 1216
  br["2014 11"] = 1115
  br["2014 10"] =  611
  br["2014 09"] =  778
  br["2014 08"] = 1035
  br["2014 07"] =  954
  br["2014 06"] =  861

  # exclude company
  # ec["4CHANGE ENERGY"]

  # exclude plan
  # ro["Gexa Choice Conserve 5"]
}
NR == 1 {
  while (ta++ < NF) {
    xr[$ta] = ta
  }
}
$xr["Rate Type"] == "Fixed" {
  for (ta in ec) {
    if ($xr["RepCompany"] == ta) {
      next
    }
  }
  for (ta in ro) {
    if ($xr["Plan Name"] == ta) {
      next
    }
  }
  tot = 0
  for (ta in br) {
    if (br[ta] >= 1000) {
      tot += $xr["Price/kWh 1000"] * br[ta]
    }
    else {
      tot += $xr["Price/kWh 500"] * br[ta]
    }
  }
  zu[NR, 1] = tot
  zu[NR, 2] = $xr["RepCompany"]
  zu[NR, 3] = $xr["Price/kWh 500"]
  zu[NR, 4] = $xr["Price/kWh 1000"]
}
END {
  for (ta = 2; ta <= NR; ta++) {
    printf "$%.0f - %s - 500 kWh %s - 1000 kWh %s\n",
    zu[ta, 1], zu[ta, 2], zu[ta, 3], zu[ta, 4]
  }
}
