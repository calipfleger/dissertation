# Chapter 3 — Literature review

_Canonical literature review for this chapter. Updated nightly by the `nightly-session-recap` loop: for each substantive topic covered in a session, Claude appends a cited paragraph under the relevant theme heading. Weekly, the `weekly-literature-reviews` loop supplements this with broader scans from `search-queries.md`._

**Citation style:** inline narrative like (Smith et al., 2021); full entries live in `bibliography.bib`.

---

## Scope

_One-paragraph description of what this chapter investigates. Fill in when the working topic is decided._

---

## Themes

_Themes will be added here automatically as topics come up in sessions. Each theme has a short narrative paragraph with inline citations. Move or rename headings freely — the loop will use the existing headings when it recognizes a theme, and create a new "## " heading only if nothing matches._

---

## Theme: ENSO teleconnections to California precipitation

<!-- AUTO 2026-04-26 phase-4 -->
::: {.under-review}
The canonical view of ENSO as the dominant driver of California precipitation variability has been complicated by recent work that emphasizes the role of atmospheric rivers (ARs) and the California Precipitation Mode (CPM). Guirguis et al. (2024) reinterpret ENSO's role using a conditional framing: rather than a monotonic wet El Niño / dry La Niña response, they find that ENSO's influence is mediated by the AR landfall position and frequency, with El Niño conditions increasing the probability of heavy AR events only when atmospheric circulation anomalies align correctly [@guirguis2024enso]. Chen et al. (2021) identify a spatially coherent CPM — a low-frequency precipitation pattern distinct from ENSO teleconnections — that accounts for a large fraction of interannual variance in California rainfall and is tied to variations in the North Pacific jet stream and AR genesis regions [@chen2021distinct]. Both findings are relevant for Ch3's framing: if volcanic forcing drives El Niño–like anomalies (per Stevenson et al. 2016 and Adams et al. 2003), the downstream California precipitation response may be contingent on background circulation state in ways that complicate a simple signal detection. Torbenson et al. (2025) provide paleo context by documenting a ~1700 CE disruption of Pacific drought teleconnections in tree-ring records across the Pacific Rim; while not focused on volcanic forcing, this result suggests that ENSO-hydroclimate teleconnections are not stationary through the Common Era — a potential caveat for Ch3's attribution claims [⚠ uncertain relevance; @torbenson2025disruption].

**References:** @chen2021distinct; @guirguis2024enso; @torbenson2025disruption
:::
<!-- END AUTO 2026-04-26 phase-4 -->

## Gaps & open questions

_Things the literature hasn't addressed, or areas where findings disagree. Auto-appended by Claude when searches surface disagreement._

---

## References

_Full BibTeX entries are in `bibliography.bib`. This section shows a human-readable author-year list for quick scanning — the loop keeps it sorted alphabetically by first-author surname._

<!-- AUTO 2026-04-23 phase-4 -->
::: {.under-review}
Understanding how volcanically-triggered El Niño events translate into California hydroclimate impacts requires grounding in the literature on ENSO–California precipitation teleconnections and their inherent variability. Guirguis et al. [@guirguis2024enso] demonstrate using over seven decades of California precipitation and snow records that ENSO modulates the *character* of impactful wet weather regimes — particularly synoptic circulation characteristics — but does not strongly modulate the *seasonal frequency* of those regimes. This distinction has an important implication for the Chapter 3 analysis: if volcanically-forced ENSO events alter the character but not the frequency of Rossby-wave-mediated atmospheric rivers reaching California, composite-based detection of a volcano–California precipitation signal may require regime-aware stratification rather than simple seasonal totals. Zamora-Reyes et al. [@zamorareyes2022california] provide a 600-year tree-ring context for California hydroclimate variability, showing that the 20th century's anomalous variability is driven by increasingly wet extremes rather than droughts — a pattern not seen at any other period in the reconstruction. This sets a baseline against which any post-volcanic precipitation anomaly must be evaluated, since eruptions occurring during the already-volatile 20th century are embedded in an unusual background. Finally, Evans et al. [@evans2022intrinsic] use a linear inverse model calibrated against the CESM Last Millennium Ensemble and CMIP5/6 to demonstrate that the ENSO–southwest-US hydroclimate teleconnection exhibits century-scale intrinsic variability that can produce decade-long intervals of non-significant or reversed correlations — complicating the detection of a forced volcanic signal and underlining the value of ensemble-based attribution methods.
:::

## References (2026-04-23 phase-4)

- Guirguis, K. et al. (2024). *Geophys. Res. Lett.*, 51(14). [10.1029/2024GL110326](https://doi.org/10.1029/2024GL110326)
- Zamora-Reyes, D. et al. (2022). *Geophys. Res. Lett.*, 49(19). [10.1029/2022GL099582](https://doi.org/10.1029/2022GL099582)
- Evans, C. P. et al. (2022). *Geophys. Res. Lett.*, 49(23). [10.1029/2022GL099770](https://doi.org/10.1029/2022GL099770)

_Results retrieved by Scholar Gateway · Summary generated by AI — verify claims against source documents · Last corpus update: February 2026_

<!-- AUTO 2026-04-25 phase-4 -->
::: {.under-review}

### Volcanic forcing, Indo-Pacific teleconnections, and California precipitation _(added 2026-04-25)_

A central challenge for Chapter 3 is establishing the physical pathway by which tropical volcanic eruptions influence California precipitation — a chain that runs through ENSO modulation, but also involves broader Indo-Pacific variability. Tiger and Ummenhofer (2023) demonstrate that large tropical eruptions do not act on the Pacific in isolation: low-frequency Indo-Pacific variability on decadal timescales combines with volcanic radiative forcing to amplify or suppress extreme Indian Ocean Dipole (IOD) events [@tiger2023tropical]. Because ENSO and the IOD are non-linearly coupled — especially during boreal fall when both are active — this finding implies that the volcanic-ENSO teleconnection reaching California may be conditioned on background IOD state. Chapter 3 should consider stratifying the volcanic response analysis by IOD phase, particularly for eruptions in the late 20th century (El Chichón 1982; Pinatubo 1991) where observational IOD records exist. The result also reinforces the value of last-millennium model ensembles over the observational record alone: only an ensemble of simulations can average over IOD background state variability to isolate the forced volcanic component of the ENSO response.

:::

## References (2026-04-25 phase-4)

- Tiger, B. H., & Ummenhofer, C. C. (2023). *Geophys. Res. Lett.*, 50(19). [10.1029/2023GL103991](https://doi.org/10.1029/2023GL103991)

_Results retrieved by Scholar Gateway · Summary generated by AI — verify claims against source documents · Last corpus update: February 2026_

<!-- AUTO 2026-05-04 phase-4 -->
::: {.under-review}
The physical mechanism linking volcanic forcing to western United States drought risk has been clarified by a recent paleoclimate synthesis. [@todd2025drought] use speleothem leaf-wax δD records from New Mexico together with last-millennium iCESM simulations to show that SW US hydroclimate is strongly sensitive to North Pacific SST anomalies — specifically, that a cooling of the central North Pacific drives a southward shift in the storm track and precipitation deficit over California and the Great Basin. Critically, Pausata et al. appear as co-authors, embedding the result within the same modelling community as Ch2's volcanic forcing analysis. Because tropical volcanic eruptions of the El Chichón and Pinatubo scale cool the tropical Pacific and drive a strengthened North Pacific High via the Walker Circulation teleconnection, the mechanism documented by [@todd2025drought] constitutes a plausible dynamical pathway by which post-eruption cooling could amplify California drought risk independently of any direct ENSO signal. For Chapter 3, this implies that the post-eruption hydroclimate anomaly over California may reflect both a direct ENSO-driven precipitation response and a secondary North Pacific pathway — a two-pathway framework that warrants explicit separation in the composite analysis.
:::

## References (2026-05-04 phase-4)

- Todd, V. L. et al. (2025). *Nature Geoscience*, 18(7), 646–652. [10.1038/s41561-025-01726-z](https://doi.org/10.1038/s41561-025-01726-z)

_Results retrieved via CrossRef + WebSearch fallback · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-04_

<!-- AUTO 2026-05-05 phase-4 -->
::: {.under-review}
Two complementary 2025 studies sharpen the picture of how volcanic forcing interacts with California hydroclimate through ENSO and atmospheric river pathways. [@zhang2025ensotel] quantify the disruption of ENSO summer teleconnections globally following major tropical eruptions, showing that during eruption years ENSO-temperature correlations shift direction in over 60 percent of teleconnected regions — a finding that directly challenges the use of canonical El Niño composites to reconstruct volcanic impacts on California climate. Independently, [@lunanino2025heresy] identify "heretical" La Niña water years (2011, 2017, 2023) in which anomalously high atmospheric river frequency produced California-wide precipitation that matched or exceeded the canonical 1998 El Niño year, demonstrating that AR variability can decouple precipitation from ENSO phase entirely. Together these studies imply that the Chapter 3 composite analysis must account for both the suppression of ENSO teleconnection fidelity under volcanic aerosol loading and the possibility that AR activity, modulated independently of ENSO, could mask or amplify the volcanic hydroclimate signal in California coastal and inland proxy records.
:::

## References (2026-05-05 phase-4)

- Zhang, X. et al. (2025). *Nature Communications*, 16, 9882. [10.1038/s41467-025-64879-w](https://doi.org/10.1038/s41467-025-64879-w)
- Luna-Niño, R. et al. (2025). *Climate Dynamics*, 63(2), 115. [10.1007/s00382-025-07583-1](https://doi.org/10.1007/s00382-025-07583-1)

_Results retrieved via CrossRef + WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-05_

<!-- AUTO 2026-05-13 phase-4 -->
::: {.under-review}
A high-resolution attribution study of the February 2024 Southern California flooding event provides a recent observational test case for the multiscale ENSO–AR coupling that Chapter 3 examines in a paleo context. [@mazza2025multiscale] decompose the drivers of anomalous precipitation and flooding into four interacting components — El Niño preconditioning, a persistent and amplified MJO, a strengthened North Pacific jet, and the landfalling atmospheric river itself — showing that no single factor alone would have produced the observed flooding magnitude. Their finding that an El Niño–MJO interaction effectively doubled AR water vapour flux relative to a purely ENSO-driven baseline has direct implications for Chapter 3: it suggests that the fingerprint of ENSO forcing on California hydroclimate is substantially modulated by synoptic-scale internal variability, implying that single-event or composite approaches to volcanic-ENSO attribution in the coral and tree-ring proxy record must account for this irreducible internal noise. The result also supports using ensemble frameworks — rather than composite means alone — when evaluating the statistical significance of the Chapter 3 hydroclimate response pattern.
:::

## References (2026-05-13 phase-4)

- Mazza, A. et al. (2025). *npj Climate and Atmospheric Science*, 8(1). [10.1038/s41612-025-01242-2](https://doi.org/10.1038/s41612-025-01242-2)

_Results retrieved via CrossRef + WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-13_

<!-- AUTO 2026-05-14 phase-4 -->
::: {.under-review}
Sub-seasonal teleconnection variability provides an important source of noise when compositing California hydroclimate around volcanic events. [@elaskary2025teleconnection] link western US streamflow extremes to the Western Pacific Oscillation and Eastern Pacific/North Pacific Oscillation on sub-seasonal timescales, showing that hydrological whiplash events are modulated by these modes independently of the seasonal ENSO state. Including MJO phase and WP/EPO indices as covariates in Chapter 3's regression framework would help isolate the volcanically-forced precipitation signal from sub-seasonal noise. ⚠ relevance uncertain — no explicit volcanic forcing.
:::

## References (2026-05-14 phase-4)
- El-Askary, H. et al. (2025). Atmospheric teleconnection patterns and hydrological whiplashes in the Western U.S. *Scientific Reports*, 15, 21262. [10.1038/s41598-025-06087-6](https://doi.org/10.1038/s41598-025-06087-6)

_Results retrieved via WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-14_

<!-- AUTO 2026-05-22 phase-4 -->
::: {.under-review}
Paleoclimate reconstructions of atmospheric river (AR) activity in California reveal that the modern instrumental record systematically underestimates the full range of pluvial variability. [@knight2024ar] used silicon-aluminum enrichment layers in a 3,200-year sediment record from Leonard Lake to reconstruct integrated vapor transport, finding that the largest AR episodes occurred two and three millennia ago and that modern AR intensity — while elevated since the late twentieth century — remains below past maxima associated with the Medieval Climate Anomaly and earlier pluvial events. This work directly contextualizes the volcanically-triggered precipitation anomalies examined in this chapter: if volcanic forcing shifts ENSO into an El Niño-like state, the resulting enhancement of California winter precipitation would likely manifest as intensified AR landfalls, but the paleoclimate record cautions against interpreting any single AR cluster as unprecedented over centennial timescales.
:::

<!-- AUTO 2026-05-29 phase-4 -->
::: {.under-review}
A new 504-year reconstruction of Sierra Nevada growing-season maximum temperature provides the longest high-resolution proxy record yet assembled for California and independently confirms the volcanic cooling signal in western North American tree-ring proxies. [@harley2026california] developed the reconstruction from blue-intensity and maximum latewood-density measurements at nine high-elevation conifer sites, explaining 60% of instrumental temperature variance; four of the five coldest years in the entire record coincide with major volcanic eruptions, while the warmest year (2021) exceeded the prior maximum by more than 2°C. For Chapter 3, this result establishes that the volcanically-triggered temperature signal is detectable in precisely the proxy archive type (high-elevation conifer densitometry) most likely to respond to the same Pacific SST and atmospheric circulation anomalies that appear in coral δ¹⁸O records. The overlap between volcanic cooling years and historically documented La Niña-state conditions in California warrants direct comparison with the El Niño-like post-eruption SST anomalies diagnosed in Chapter 2. ⚠ relevance uncertain — this study focuses on temperature and fire interactions, not hydroclimate teleconnections or coral proxies; verify that volcanic cold-year signal is not confounded by direct radiative cooling rather than ENSO-mediated changes.
:::

## References (2026-05-29 phase-4)
- Harley, G.L. et al. (2026). California Temperature Since 1520 CE Shows Interactions in Extremes of Heat, Drought, and Fire. *Geophysical Research Letters*. [10.1029/2025GL118590](https://doi.org/10.1029/2025GL118590) ⚠ relevance uncertain

_Results retrieved via WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-29_
