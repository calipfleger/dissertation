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
    stats["n_eruptions"] = len(stats["eruptions"])   # 2 — El Chichón + Pinatubo
    stats["ttest_n_pairs"] = (                 # member × eruption pairs used in §3.1 t-test
        stats["n_members"] * stats["n_eruptions"]
    )
    stats["ttest_p_threshold"] = 0.05          # policy constant
    stats["iso2k_window_years"] = 7            # Y0-Y7 post-eruption window

    # -------------------------------------------------------------------------
    # §3.1 — lag window over which composite SEA is significant at p<0.05
    # -------------------------------------------------------------------------
    # These numbers appear in prose at chapter2.qmd §3.1 line 90:
    #   "...significantly different from zero at p < 0.05 at lags
    #    +{sea_sig_lag_min_months} to +{sea_sig_lag_max_months} months..."
    #
    # How to compute from existing analysis:
    #   sea_bootstrap.py runs the SEA + bootstrap CI + t-test. Its stdout
    #   prints "Significant lags bootstrap p<0.05: <N>/<total>". Before the
    #   print, the variable `boot_sig95` is a boolean mask (n_lags long)
    #   indicating which lags are significant. The array `lags` goes from
    #   -24 to +84 months. So:
    #
    #       sig_lags = lags[boot_sig95]   # e.g. array([10, 11, 12, ..., 26])
    #       stats["sea_sig_lag_min_months"] = int(sig_lags.min())
    #       stats["sea_sig_lag_max_months"] = int(sig_lags.max())
    #
    # If you want only the CENTRAL cluster (ignoring isolated significant
    # lags at the tails), filter to lags > 0 first, or look for the largest
    # contiguous run.
    #
    # Simplest path: run sea_bootstrap.py, note the min and max significant
    # lag from the output figure or add a `np.save("sea_sig_lags.npy", ...)`
    # line to save it, then load here.
    stats["sea_sig_lag_min_months"] = None     # ⚠ TODO: see header comment
    stats["sea_sig_lag_max_months"] = None     # ⚠ TODO: see header comment

    # -------------------------------------------------------------------------
    # §3.4 — iso2k sites passing p<0.05 per eruption
    # -------------------------------------------------------------------------
    # These numbers appear in prose at chapter2.qmd §3.4 line 106:
    #   "...observed iso2k mean at p < 0.05 sites (El Chichón n = {X} sites,
    #    Pinatubo n = {Y} sites)..."
    #
    # How to compute:
    #   iso2k_comparison.py produces site-level p-values. Either check the
    #   arrays it saves to _cache/ or compute directly. The site count at
    #   p<0.05 is the number of iso2k coral sites where the pseudo-coral
    #   vs observed iso2k correlation is significant for that eruption.
    #
    # If iso2k_comparison.py saves per-site p-values as an array of length
    # n_iso2k_sites (currently 89), the extraction is:
    #
    #       import numpy as np
    #       p_chichon = np.load("_cache/iso2k_pvals_chichon.npy")   # or wherever
    #       stats["iso2k_sig_sites_chichon"] = int((p_chichon < 0.05).sum())
    #       p_pinatubo = np.load("_cache/iso2k_pvals_pinatubo.npy")
    #       stats["iso2k_sig_sites_pinatubo"] = int((p_pinatubo < 0.05).sum())
    #
    # If no cached per-site p-values exist yet, add an `np.save(...)` line
    # to iso2k_comparison.py and re-run it once.
    stats["iso2k_sig_sites_chichon"] = None    # ⚠ TODO: see header comment
    stats["iso2k_sig_sites_pinatubo"] = None   # ⚠ TODO: see header comment

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
