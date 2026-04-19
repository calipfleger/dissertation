"""
compute_stats.py — compute every inline statistic cited in chapter2.qmd.

Run this script after any analysis change. It writes a single stats.json
that chapter2.qmd reads at render time. Inline values like r, p, n, and %
are pulled from this JSON, not hardcoded in prose.

How to use:
    python3 code/compute_stats.py

This produces chapter-2-volc-enso/code/stats.json. The chapter .qmd then
interpolates via `{python}` chunks like:

    ```{python}
    #| echo: false
    import json
    stats = json.load(open("code/stats.json"))
    ```

    r = `{python} round(stats["enso_amplitude_r_cesm_lme"], 2)`

Fill in each TODO below with a real computation against your actual data.
Never write a hardcoded number into chapter2.qmd — compute it here and
reference the key. This is the only way to keep the website honest as
the analysis evolves.
"""
from __future__ import annotations

import json
import os
from pathlib import Path

HERE = Path(__file__).parent
OUT = HERE / "stats.json"

# ---------------------------------------------------------------------------
# Computations (fill in with real data loads + analysis)
# ---------------------------------------------------------------------------

def compute_all() -> dict:
    stats: dict = {}

    # --- Study-design constants (not computed — policy decisions) -----------
    stats["n_members"] = 4                     # iCESM ensemble members
    stats["n_iso2k_sites"] = 89                # tropical coral sites in iso2k
    stats["start_year"] = 1950
    stats["end_year"] = 2005
    stats["eruptions"] = ["El Chichón (1982)", "Pinatubo (1991)"]

    # --- Stats that MUST be recomputed from data ----------------------------
    # TODO: load CESM-LME Niño 3.4 series from run_local.py output cache.
    # Example stub:
    # import numpy as np
    # nino = np.load("../../volcano\\ enso/_cache/nino34_composite.npy")
    # forced = np.load("../../volcano\\ enso/_cache/amplitude_forced.npy")
    # internal = np.load("../../volcano\\ enso/_cache/amplitude_internal.npy")
    # r = np.corrcoef(forced, internal)[0, 1]
    # stats["enso_amplitude_r_cesm_lme"] = float(r)

    stats["enso_amplitude_r_cesm_lme"] = None  # ⚠ TODO: compute from data
    stats["sea_peak_month"] = None             # ⚠ TODO: month of Niño 3.4 peak post-eruption
    stats["sea_peak_celsius"] = None           # ⚠ TODO: peak Niño 3.4 anomaly
    stats["ttest_n"] = stats["n_members"]      # already a policy constant
    stats["ttest_n_pairs"] = (                 # member × eruption pairs used in §3.1 t-test
        stats["n_members"] * len(stats["eruptions"])
    )
    stats["ttest_p_threshold"] = 0.05          # policy constant
    stats["iso2k_window_years"] = 7            # Y0-Y7 post-eruption window

    # §3.1 — lag window over which composite SEA is significant at p<0.05
    stats["sea_sig_lag_min_months"] = None     # ⚠ TODO: first lag where |t| > crit
    stats["sea_sig_lag_max_months"] = None     # ⚠ TODO: last lag where |t| > crit

    # §3.4 — iso2k sites passing p<0.05 per eruption
    stats["iso2k_sig_sites_chichon"] = None    # ⚠ TODO: count sites with p<0.05 vs pseudo-coral
    stats["iso2k_sig_sites_pinatubo"] = None   # ⚠ TODO: count sites with p<0.05 vs pseudo-coral

    # --- Figure-level stats (one per referenced figure) ---------------------
    # For each figure, record the statistical summary the caption cites.
    # Keeps captions in chapter2.qmd honest.
    stats["fig_sea_nino34"] = {
        "peak_month_range": None,              # ⚠ TODO: e.g. "12-18 months"
        "peak_celsius": None,
    }
    stats["fig_enso_amplitude"] = {
        "n_members_la_nina": None,             # ⚠ TODO: count
        "n_members_el_nino": None,
        "amplitude_la_nina_mean": None,
        "amplitude_el_nino_mean": None,
    }
    stats["fig_proxy_skill_map"] = {
        "median_r": None,                      # ⚠ TODO: median model-proxy correlation
        "n_sites_p_sig": None,                 # sites with both p<0.05
    }

    # --- Flag if any required stat is still None ----------------------------
    missing = [k for k, v in stats.items()
               if v is None
               or (isinstance(v, dict) and any(vv is None for vv in v.values()))]
    if missing:
        stats["_warnings"] = [f"missing: {m}" for m in missing]

    return stats


def main() -> None:
    stats = compute_all()
    OUT.write_text(json.dumps(stats, indent=2, default=str))
    print(f"Wrote {OUT.relative_to(HERE.parent)}")
    if "_warnings" in stats:
        print("\nWARNINGS:")
        for w in stats["_warnings"]:
            print(f"  ⚠ {w}")
        print("\nFill in the TODOs in compute_stats.py and re-run before rendering.")


if __name__ == "__main__":
    main()
