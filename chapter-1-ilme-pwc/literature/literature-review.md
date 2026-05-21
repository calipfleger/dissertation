# Chapter 1 — Literature review (iLME PWC)

_Canonical literature review for this chapter. Updated nightly by the `nightly-session-recap` loop and weekly by the `weekly-literature-reviews` loop._

**Chapter topic:** Pacific Walker Circulation analyzed with the isotope-enabled Last Millennium Ensemble (iLME / iCESM).

**Drive artifacts that already exist for this chapter** (mirrored as .md under `drafts/`):
- "Ch1: iLME PWC PAPER" (Google Doc)
- "PWC PAPER 1 8_24" (Google Doc)
- "24 PWC Paper Bibliography" (Google Doc)
- "Paper 1 Figure Captions" (Google Doc)
- "iPWC Data Tracker" (Google Sheet)

**Citation style:** inline narrative like (Smith et al., 2021); full entries live in `bibliography.bib`.

---

## Scope

_One-paragraph description of the PWC-iCESM chapter. Fill in._

---

## Themes

_Themes are added here automatically as substantive topics come up in sessions._

---

## Theme: Walker Circulation trends — forced vs. internal variability

<!-- AUTO 2026-04-26 phase-4 -->
::: {.under-review}
A central interpretive challenge for Ch1 is separating the forced Walker Circulation (PWC) response from multi-decadal internal variability. Heede & Fedorov (2023) offer a direct decomposition: they find that the early-21st-century PWC strengthening and cold eastern equatorial Pacific (EEP) are primarily attributable to the Interdecadal Pacific Oscillation (IPO) in its negative phase, with the long-run forced response actually pointing toward weakening under continued greenhouse gas forcing — consistent with the Held-Soden thermodynamic expectation [@heede2023colder]. Watanabe et al. (2023) identify two competing mechanisms driving the observed trend: a La Niña–like cooling of the EEP (reinforcing the PWC) and an Indo-Pacific warming pattern that acts to weaken it, with their net effect explaining the observed multidecadal ambiguity in reanalyses [@watanabe2023two]. On the feedbacks side, Fu & Fedorov (2023) show that the Bjerknes feedback and shortwave cloud feedbacks together govern whether the EEP warms or cools relative to the warm pool in CMIP6 models, explaining much of the inter-model spread in projected tropical Pacific SST gradients [@fu2023bjerknes]. For iLME/iCESM attribution, this framing is useful: isotopic signatures of PWC strength in the iCESM ensemble should be screened against the background IPO phase to isolate the forced signal. Shrestha & Soden (2023) further corroborate an anthropogenic weakening of large-scale atmospheric overturning detectable in the satellite era, lending observational support to the thermodynamic weakening prediction [@shrestha2023anthropogenic]. Model biases — specifically the equatorial cold-tongue bias — may cause models like iCESM to overestimate PWC strengthening during La Niña states; Wills et al. (2022) document these biases in CMIP6 and their implication for trend attribution [@wills2022systematic].

**References:** @fu2023bjerknes; @heede2023colder; @shrestha2023anthropogenic; @watanabe2023two; @wills2022systematic
:::
<!-- END AUTO 2026-04-26 phase-4 -->

## Gaps & open questions

---

## References

_Full BibTeX entries are in `bibliography.bib`. See also the existing "24 PWC Paper Bibliography" Google Doc, mirrored in `drafts/`._

---

<!-- AUTO 2026-04-20 phase-4 -->
::: {.under-review}
The question of whether the Pacific Walker Circulation (PWC) has strengthened or weakened under anthropogenic forcing remains actively contested between models and observations. Models in CMIP5 and CMIP6 consistently project PWC weakening in response to greenhouse gas forcing, driven by energetic constraints on the global hydrological cycle [@heede2023colder; @lu2021mechanisms], yet observations since the 1980s show a pronounced strengthening, characterised by intensified Indo-Pacific Warm Pool warming and eastern equatorial Pacific cooling. Wills et al. [@wills2022systematic] demonstrate that the large-scale patterns of observed sea-surface temperature and sea-level pressure trends over 1979–2020 differ significantly from CMIP5/6 historical simulations at less than a 5% probability of arising from internal variability alone, pointing to systematic model biases in the forced response rather than simply unrepresented internal variability. A partial resolution is offered by Heede and Fedorov [@heede2023colder], who partition the observed SST trend into a uniform warming component, a negative Pacific Decadal Oscillation (PDO) pattern, and a forced Northern Hemisphere–Indo-West Pacific warming mode that is reproduced in a subset of CMIP6 models; it is the simultaneous occurrence of the latter two signals that drives the observed Walker strengthening. Shrestha and Soden [@shrestha2023anthropogenic] add a further nuance: despite the regional strengthening of the Pacific Walker cell, the global zonally asymmetric overturning circulation has weakened in the satellite era, consistent with theoretical predictions of reduced atmospheric overturning under warming, and this weakening is only reproduced in coupled models when anthropogenic forcing is included. Lu et al. [@lu2021mechanisms] show that the fast Walker response to CO₂ forcing (within the first two years) depends critically on air–sea coupling strength, with strongly coupled models producing a temporary strengthening via Bjerknes feedback before the long-term weakening emerges. These findings collectively frame the iCESM Last Millennium Ensemble as an important test bed: if systematic model biases underlie the model–observation discrepancy, examining the PWC's isotopic fingerprint (δ¹⁸O) across forced and unforced variance components in the iCESM LME may help identify which component of the circulation change is encoded in proxy records.
:::

## References (2026-04-20 additions)

- Wills, R. C., Dong, Y., Proistosecu, C., Armour, K. C., & Battisti, D. S. (2022). *Geophys. Res. Lett.*, 49(17). [10.1029/2022GL100011](https://doi.org/10.1029/2022GL100011)
- Shrestha, S., & Soden, B. J. (2023). *Geophys. Res. Lett.*, 50(22). [10.1029/2023GL104784](https://doi.org/10.1029/2023GL104784)
- Heede, U. K., & Fedorov, A. V. (2023). *Geophys. Res. Lett.*, 50(3). [10.1029/2022GL101020](https://doi.org/10.1029/2022GL101020)
- Lu, K., He, J., Fosu, B., & Rugenstein, M. (2021). *Geophys. Res. Lett.*, 48(23). [10.1029/2021GL095708](https://doi.org/10.1029/2021GL095708)
- Li, Z., Yang, S., Tam, C., & Hu, C. (2020). *Int. J. Climatol.*, 41(2), 1455–1464. [10.1002/joc.6856](https://doi.org/10.1002/joc.6856)

_Results retrieved by Scholar Gateway · Summary generated by AI — verify claims against source documents · Last corpus update: February 2026_

---

<!-- AUTO 2026-04-21 phase-4 -->
::: {.under-review}
Two recent studies strengthen the methodological foundation for using isotope-enabled GCMs to fingerprint Walker Circulation change. Bong et al. [@bong2026wisomip] present the Water Isotope Model Intercomparison (WisoMIP), which systematically benchmarks eight isotope-enabled atmospheric GCMs — including iCESM — against observational δ¹⁸O_p and δ²H_p records from the GNIP network and tropical radiosonde profiles. WisoMIP identifies systematic model-dependent biases in the tropical Pacific isotope field: iCESM reproduces the broad zonal gradient in δ¹⁸O_p but exhibits a wet bias in the Maritime Continent that depresses local δ¹⁸O_p values by 1–2‰, a bias that partly reflects the cold-tongue SST bias shared across many coupled models. The intercomparison framework provides a direct benchmark against which the Ch1 iCESM-forced experiments can be evaluated, and motivates treating absolute δ¹⁸O_p values cautiously in favour of forced anomaly patterns. Hu et al. [@hu2020speedy] complement this by isolating the role of convective parameterisation in setting δ¹⁸O_p variability within isotope-enabled models: using the SPEEDY-IER model under varying convective schemes, they show that the large-scale δ¹⁸O_p gradient tracks Walker Circulation strength (as measured by the east–west SLP gradient) in simulations with strong convective entrainment, but not in those with weak entrainment — indicating that the isotopic Walker signal is sensitive to how deep convection is parameterised. Together, WisoMIP and SPEEDY-IER support the Ch1 hypothesis that iCESM δ¹⁸O_p anomalies can fingerprint forced PWC changes, while simultaneously cautioning that quantitative comparisons with Iso2k proxy records [@konecky2020iso2k] must account for both model-specific isotope biases (Bong et al.) and the convective-scheme sensitivity of the isotope–circulation link (Hu et al.).
:::

## References (2026-04-21 additions)

- Bong, H., et al. (2026). *J. Geophys. Res. Atmos.* [10.1029/2025JD044985](https://doi.org/10.1029/2025JD044985)
- Hu, J., Emile-Geay, J., Nusbaumer, J., & Noone, D. (2020). *J. Adv. Model. Earth Syst.*, 12(11). [10.1029/2020MS002163](https://doi.org/10.1029/2020MS002163)

_Results retrieved by Scholar Gateway · Summary generated by AI — verify claims against source documents · Last corpus update: February 2026_

<!-- AUTO 2026-04-30 phase-4 -->
::: {.under-review}
A landmark reconstruction by [@falster2023pwc] synthesized annually resolved paleoproxy records spanning 1200–2000 CE to constrain PWC variability over the last millennium. Their key result — that the pronounced 1992–2011 PWC strengthening, while statistically anomalous, falls within the envelope of pre-industrial variability — substantially revises prior expectations derived from model simulations alone. Critically, the strengthening is assessed as unlikely to reflect volcanic forcing, with anthropogenic aerosol loading or internal low-frequency variability identified as more probable drivers. For the present iCESM LME analysis, this finding motivates a careful partitioning of the forced versus internally generated components of simulated PWC changes, particularly in the post-Pinatubo period (1991–2000) where both volcanic and aerosol signals are simultaneously present in the forcing.
:::

<!-- AUTO 2026-05-05 phase-4 -->
::: {.under-review}
A recent study by [@cho2025iwc] ⚠ relevance uncertain provides a useful methodological companion for the iCESM-based δ¹⁸Op approach central to Chapter 1. Cho et al. use the iCESM-iLME, ECHAM5-wiso, and ERA5 reanalysis to examine how the Indian Walker Circulation (IWC) imprints on δ¹⁸Op variability across the Indian Ocean Basin during both the instrumental era and the last millennium. Their core finding — that stable isotopes in precipitation effectively capture large-scale atmospheric circulation signals even during periods of low precipitation variability — validates the use of δ¹⁸Op as an integrative Walker Circulation tracer over centennial timescales. Although their focus is the IWC rather than the Pacific Walker Circulation (PWC), the authors explicitly document interactions between the IWC and PWC that modulate δ¹⁸Op across the Indo-Pacific region, and they exploit the same iCESM-iLME framework that underlies Chapter 1's forced experiments. The overlap in model infrastructure and co-authorship with Falster [@falster2023pwc] makes this a relevant cross-reference for benchmarking the δ¹⁸Op fingerprint methodology developed in Chapter 1, while the IWC focus warrants care in direct interpretation.
:::

## References (2026-05-05 phase-4)

- Cho, P. G. et al. (2025). *J. Geophys. Res. Atmos.*, 130(8). [10.1029/2025JD043840](https://doi.org/10.1029/2025JD043840) ⚠ relevance uncertain

_Results retrieved via CrossRef fallback · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-05_

<!-- AUTO 2026-05-12 phase-4 -->
::: {.under-review}
Recent modelling work by [@kang2025sst] provides new constraints on the Walker Circulation response to observed La Niña-like tropical Pacific SST trends. Using pacemaker and hindcast simulations, Kang et al. demonstrate that constraining coupled models to match observed tropical Pacific SST trends produces a robust La Niña-like circulation response in boreal winter, substantially reducing tropical tropospheric warming and improving precipitation and surface temperature trends in ENSO-sensitive regions. This result is directly relevant to Ch1's central question of how forced versus internally-driven Pacific SST gradients partition Walker Circulation variance in iCESM: the inter-model spread in simulated SST trend magnitude propagates into equivalent spread in circulation trends, suggesting that iLME ensemble members constrained by realistic volcanic + anthropogenic boundary conditions should narrow the uncertainty range in PWC diagnostic output. ⚠ relevance uncertain — paper's primary focus is on the model-observation SST discrepancy rather than isotopic fingerprinting.
:::

<!-- AUTO 2026-05-21 phase-4 -->
::: {.under-review}
A multi-model attribution study clarifies both the timing and the physical determinants of the forced Walker Circulation response to greenhouse gas increases, with implications for how Chapter 1 interprets the iCESM Last Millennium Ensemble signal. [@wu2024emergence] show, using a large ensemble of CMIP6-class models, that the human-induced weakening of the Walker Circulation emerges detectably from internal variability earlier than previously estimated, and that the dominant determinant of emergence timing is the ratio of forced SST gradient change to internal tropical Pacific variability. For Chapter 1, this finding sharpens the attribution argument: the iCESM LME provides a controlled setting in which volcanic, solar, and greenhouse forcings can be isolated, and the [@wu2024emergence] framework for quantifying signal-to-noise ratio against internal variability directly informs the statistical approach for separating forced Walker Circulation trends from internal decadal variability in the δ¹⁸O proxy record.
:::

## References (2026-05-21 phase-4)
- Wu, M. et al. (2024). Early emergence and determinants of human-induced Walker circulation weakening. *Nature Communications*, 15, 9161. [10.1038/s41467-024-53509-6](https://doi.org/10.1038/s41467-024-53509-6)

_Results retrieved via WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-21_
