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

<!-- AUTO 2026-05-30 phase-4 -->
::: {.under-review}
Observed changes in atmospheric river activity over the western United States over the past four decades provide important baseline context for interpreting volcanically-triggered hydroclimate anomalies. [@dong2025opposing] analyzed multiple observational AR products and found a systematic decline in winter AR frequency and intensity over the western US alongside notable increases over the eastern US — a divergence driven by strengthening Pacific anticyclonic circulation patterns that simultaneously deflect ARs away from California while routing them toward the Gulf Coast and eastern seaboard. The Pacific-origin variability responsible for this pattern is the same large-scale circulation mode — anomalous anticyclogenesis in the central and eastern North Pacific — that modulates the ENSO teleconnection pathway central to this chapter. The implication for Chapter 3 is that any volcanic forcing of ENSO that shifts the post-eruption state toward El Niño-like conditions would need to overcome or act in concert with this multi-decadal background trend: a post-eruption El Niño-like SST anomaly would enhance moisture transport toward California against a background of declining AR activity, potentially making the volcanic signal harder to detect in short instrumental records but more conspicuous when evaluated against the full proxy baseline. ⚠ relevance uncertain — paper does not address volcanic forcing; trend attribution is to internal Pacific variability and anthropogenic warming, not eruption timing.
:::

## References (2026-05-30 phase-4)
- Dong, W., Zhao, M., Tan, Z., & Ramaswamy, V. (2025). Opposing trends in winter Atmospheric River over the Western and Eastern US during the past four decades. *npj Climate and Atmospheric Science*, 8(1), 129. [10.1038/s41612-025-00998-x](https://doi.org/10.1038/s41612-025-00998-x) ⚠ relevance uncertain

_Results retrieved via WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-30_

<!-- AUTO 2026-08-10 phase-4 -->
## References (2026-08-10 phase-4)
- Diaz, H.F. et al. (2026). Atmospheric river activity in California since 1500: its relationship to forcing dynamics and impact on ENSO-precipitation teleconnections. *Climate Dynamics*, 64(5), 247. [10.1007/s00382-026-08221-0](https://doi.org/10.1007/s00382-026-08221-0)

_Results retrieved via WebSearch (semanticSearch substitute, per nightly-pipeline environment note) · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-08-10_

<!-- AUTO 2026-08-18 phase-1 -->
## References (2026-08-18 phase-1)
- PAGES CoralHydro2k Project Members (2023). The CoralHydro2k database: a global, actively curated compilation of coral δ18O and Sr/Ca proxy records of tropical ocean hydrology and temperature for the Common Era. *Earth System Science Data*, 15(5), 2081–2116. [10.5194/essd-15-2081-2023](https://doi.org/10.5194/essd-15-2081-2023)

Relevance to Chapter 3: ⚠ relevance uncertain — this is a pan-tropical compilation rather than an eastern-Pacific study, so it does not by itself answer whether eastern tropical Pacific and Gulf of California corals carry a coherent post-eruption signal. It is included because it is the current curated route to those records: it is machine-readable (LiPD, with MATLAB/R/Python serializations), carries standardized metadata, and pairs Sr/Ca with δ18O so that a candidate eastern-Pacific volcanic signal can be tested for a temperature versus hydrology origin. The directed search for eastern-Pacific coral responses to El Chichón and Pinatubo returned only pre-2020 material this run and produced no citable new work.

_Retrieved via WebSearch (semanticSearch substitute — see the 2026-08-18 pipeline log note) · DOI and bibliographic metadata verified against the Copernicus publisher landing page · Summary generated by AI, verify claims against the source document · Last corpus update: 2026-08-18_

<!-- AUTO 2026-08-30 phase-4 -->
## Synthesis backfill + authorship correction (2026-08-30 phase-4)

Two corrections to the 2026-08-10 entry above, both found while re-verifying that reference against the publisher record rather than through a new search.

**Authorship was wrong.** The entry was filed as "Diaz, H.F. et al. (2026)". The Springer landing page for doi:10.1007/s00382-026-08221-0 lists **Eugene R. Wahl** as first author, with Eduardo Zorita, Rosa Luna-Niño and Alexander Gershunov following and **Henry F. Diaz appearing last**. The paper should be cited in prose as *Wahl et al. (2026)*. The bibkey `diaz2026atmrivers` has been left unchanged so the three existing references to it do not break — a bibkey is a label, not an authorship claim — but the `author` field in `bibliography.bib` is now corrected and the in-text mention in `chapter3-progress.qmd` has been changed to "Wahl et al." The byline is truncated on the landing page behind a "Show authors" control, so the middle of the author list is still unconfirmed and is carried as `and others`; the PDF should be fetched to complete it before submission.

**No synthesis paragraph was ever written.** The 08-10 run added the bibliography entry and a bare line under "References (2026-08-10 phase-4)" but no prose, so the chapter's literature review has been carrying this reference without saying what it means. Filling that gap now: [@diaz2026atmrivers] reconstruct five annual indices of California atmospheric-river activity — landfall counts, integrated water vapour, integrated vapour transport and its zonal and meridional components — for northern, central and southern California back to 1500 CE, using the same assimilation-reconstruction methodology applied in earlier Pacific-North American studies, and evaluate them against reconstructed winter circulation and Pacific SSTs. Their central result is that AR activity interferes with the canonical ENSO teleconnection to California precipitation, corroborating Luna-Niño et al. (2025). For this chapter the more consequential result is the negative one: across nearly half a millennium the authors find substantial ongoing variability in both the canonical and the "heretical" ENSO–California precipitation link **without clear linkage to episodic forcing, volcanic eruptions explicitly included**, and they characterise California precipitation over that interval as approximately white noise. That is a direct challenge to this chapter's premise, and it should be treated as the strongest published counter-case rather than as supporting context. It sharpens what Chapter 3 has to demonstrate: a volcanic fingerprint in California hydroclimate must be shown to survive an AR-mediated pathway that demonstrably weakens the ENSO teleconnection the fingerprint would have to travel along, and it must be detectable against a background these authors could not distinguish from noise. Two openings remain. Their finding that AR variability reaches its highest values in the last decades of the record, which they read as a possible second-moment response to anthropogenic forcing, suggests that eruption response may be better sought in the variance than in the mean. And their analysis is precipitation- and circulation-based; it does not test the coral δ¹⁸O archives that are this chapter's actual evidence, so it constrains the mechanism rather than closing the question.

## References (2026-08-30 phase-4)
- Wahl, E. R., Zorita, E., Luna-Niño, R., Gershunov, A., … Diaz, H. F. (2026). Atmospheric river activity in California since 1500: its relationship to forcing dynamics and impact on ENSO-precipitation teleconnections. *Climate Dynamics*, 64(5), 247. [10.1007/s00382-026-08221-0](https://doi.org/10.1007/s00382-026-08221-0) — not a new reference; authorship corrected and synthesis backfilled.

_Bibliographic metadata re-verified against the Springer landing page 2026-08-30. Summary generated by AI from the published abstract — verify claims against the full text. No new references added to this chapter this run._

<!-- AUTO 2026-08-30 phase-4 -->
::: {.under-review}
Two new 2026 references speak to this chapter's two standing questions. On western North American hydroclimate, [@he2026volcaniccomparison] compare post-eruption responses across tree-ring reconstructions, nine data-assimilation products and two model ensembles, and report coherent post-eruption **wetting over the western United States** in PDSI — together with the Mediterranean Basin and southern South America — against coherent drying over northern and European Russia, central Asia and southern Siberia, with the two disagreeing elsewhere. This is the closest thing yet in this chapter's literature to a positive, multi-archive volcanic hydroclimate signal over California's region, and it comes from a non-coral archive, which makes it an independent line of support rather than a restatement of the proxy evidence. It sits in direct tension with [@diaz2026atmrivers], whose 500-year atmospheric-river reconstruction finds no clear link between California precipitation and episodic volcanic forcing — a tension the chapter should present as such rather than resolve prematurely, since the two use different variables (PDSI versus AR indices and precipitation), different spatial aggregations, and different definitions of the response window. On the coral side, [@tripp2026galapagos] answer part of this chapter's standing query about eastern tropical Pacific coral ENSO signals, but at the wrong time: their Galápagos subfossil colonies constrain ENSO variance and skewness around 4 ka, not across the El Chichón and Pinatubo interval this chapter tests. Their value here is as the eastern-Pacific coral baseline — evidence that these sites do faithfully record ENSO variance and can resolve a change in event skewness — rather than as a volcanic result. ⚠ relevance uncertain for [@tripp2026galapagos] — mid-Holocene, no volcanic analysis.
:::

## References (2026-08-30 phase-4)
- He, Z., Tejedor, E., Smerdon, J. E., Vuille, M., Polvani, L. M., Seager, R., & Sugiura, I. (2026). Comparison of global climatic responses to large tropical volcanic eruptions over the last millennium in paleoclimatic reconstructions and model simulations. *Journal of Climate*, 39(5), 1295–1313. [10.1175/JCLI-D-25-0179.1](https://doi.org/10.1175/JCLI-D-25-0179.1)
- Tripp, C. J., Cole, J. E., Tudhope, A. W., Dyez, K. A., Thompson, D. M., & Edwards, R. L. (2026). Eastern Pacific corals track robust ENSO variability and stronger La Niña events 4,000 years before present. *Geophysical Research Letters*, 53(12), e2025GL119006. [10.1029/2025GL119006](https://doi.org/10.1029/2025GL119006) ⚠ relevance uncertain

_Retrieved via WebSearch (semanticSearch substitute) · Both verified against the Crossref publisher deposit after AMS returned an empty body and Wiley returned empty then HTTP 403 · Summaries generated by AI from published abstracts — verify against full text · Last corpus update: 2026-08-30_
