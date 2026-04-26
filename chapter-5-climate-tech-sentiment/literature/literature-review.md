# Chapter 5 — Literature review

_Canonical literature review for this chapter. Updated nightly by the `nightly-session-recap` loop: for each substantive topic covered in a session, Claude appends a cited paragraph under the relevant theme heading. Weekly, the `weekly-literature-reviews` loop supplements this with broader scans from `search-queries.md`._

**Citation style:** inline narrative like (Smith et al., 2021); full entries live in `bibliography.bib`.

---

## Scope

_One-paragraph description of what this chapter investigates. Fill in when the working topic is decided._

_Provisional (inferred from 2026-04-17 work session): sentiment analysis of climate-change news coverage using GDELT as the data source and VADER as the sentiment engine, with explicit attention to validation, sampling bias, and reproducibility._

---

## Themes

### VADER validity on news headlines _(added 2026-04-17)_

Scholar Gateway · "How reliable is VADER lexicon-based sentiment analysis applied to news headlines about climate change, and what validation methods are needed?" · 8 passages · 4 articles · 2022-03-08–2026-02-20.

The evidence supports a clear conclusion: VADER (Hutto & Gilbert, 2014, as cited in Ghosh & Thajudeen, 2023) is popular because it is lexicon-based, needs no training data, and handles short informal texts well, but it *underperforms on formal journalistic writing* relative to transformer and zero-shot approaches (Ghosh & Thajudeen, 2023; Nicula et al., 2026). Against human coders, VADER systematically under-identifies negative sentiment — in one validation on a 2,341-tweet sample it agreed with trained human coders on only 49% of negative classifications, partly because lexicon methods miss sarcastic or contextually negative language without overt negative words (Lee et al., 2024). This becomes a direct problem for news-headline sentiment: Sinha et al. (2022), working with the SEntFiN 1.0 corpus of 10,753 human-annotated financial headlines, report that off-the-shelf NLTK-VADER and generic transformer sentiment systems fall far short of domain-tuned models (RoBERTa and finBERT reach F1 ≈ 93), especially on headlines containing multiple entities with conflicting sentiments. Two mitigations recur across the literature: extend VADER's lexicon with domain-specific negative and positive terms, and apply an asymmetric scaling transformation to correct VADER's well-documented *positivity bias* on formal news text (Nicula et al., 2026); and/or validate against a manually coded subset — Lee et al. (2024) achieve 86% inter-rater agreement among human coders as a reference benchmark, and recommend treating VADER output as a pre-screen rather than a final measurement. Ghosh & Thajudeen (2023) push this further by showing that Zero-Shot Learning *significantly* outperforms off-the-shelf VADER for classifying professional-community posts, providing a template for a fair head-to-head comparison the chapter could adopt.

### Media framing and public support for climate technologies: NbS, CDR, and SRM _(added 2026-04-17)_

Scholar Gateway · "Media framing of climate technologies: how are nature-based solutions, carbon dioxide removal, and solar radiation management portrayed differently in news coverage, and what explains differential sentiment?" · 8 passages · 7 articles · 2020-02-28–2024-07-04

A consistent finding across the literature is that not all climate technologies are perceived or framed equivalently, and that perceived proximity to "natural" processes is a primary driver of differential public support. Jobin & Siegrist (2020), in a Swiss survey of 1,575 respondents across 10 climate engineering technologies (7 CDR measures and 3 SRM measures), found that afforestation commanded the highest public support of any technology tested, while SRM measures showed a consistent tendency toward lower support; perceived benefits drove support universally, but perceived risk and "tampering with nature" were significant negative predictors specifically for non-nature-based interventions. This gradient from nature-aligned to techno-fix mirrors the NbS > CDR > SRM hierarchy central to Chapter 5's hypothesis. Waller et al. (2023) review perceptions research on carbon removal demonstrations and find that news media plays a largely underexplored methodological role in shaping these perceptions; their systematic review of demonstration-project studies shows that most perceptions research treats public acceptance as a management challenge rather than an epistemic dialogue, a dynamic that news sentiment data could help expose. On the governance side, McLaren & Corry (2021) document how solar geoengineering research is already entangled with its politics, with media narratives conditioning what kinds of public engagement are even attempted — an important contextual factor when interpreting time-series shifts in SRM sentiment. Carton et al. (2020) place CDR in historical and political context, arguing that carbon removal research has repeatedly reproduced narrow techno-economic framings, and that without engaging critical social science the public debate on negative emissions risks repeating past failures — a framing-gap argument that supports the relevance of a long-horizon GDELT-based analysis like Chapter 5.

---

## Gaps & open questions

- No study in this result set focuses specifically on *climate-change* headlines + VADER with formal validation against human coders — the chapter is positioned to fill that gap.
- The magnitude of VADER's positivity bias varies by corpus (Nicula et al., 2026 report it for heritage/civic reporting; Lee et al., 2024 report negativity *under*-detection on social media). A systematic comparison on climate headlines specifically has not been published in the retrieved set.
- GDELT's 250-record API ceiling (internal finding from code review) creates recency bias; no retrieved paper addresses this directly — worth searching more narrowly on GDELT sampling methodology.
- Jobin & Siegrist (2020) survey Switzerland only; a GDELT-based global newspaper analysis may show different national framing patterns for SRM vs. CDR.
- None of the retrieved studies provide a long-horizon (1980–2025) time-series of NbS/CDR/SRM sentiment in news — Ch5 is positioned to fill this directly.
- ⚠ relevance uncertain: O'Neill et al. (2022) on visual heatwave framing is tangentially relevant to media framing methods but does not address climate technologies specifically.

---

## References

_Full BibTeX entries are in `bibliography.bib`. Author-year quick index:_

- Ghosh, S., & Thajudeen, J. (2023). *Proc. ASIS&T*, 60(1), 166–178. [10.1002/pra2.778](https://doi.org/10.1002/pra2.778)
- Lee, C., Lee, S., Kim, J., & Lim, J. S. (2024). *J. Contingencies Crisis Manag.*, 32(2). [10.1111/1468-5973.12577](https://doi.org/10.1111/1468-5973.12577)
- Nicula, A., Crețan, R., Dragan, A., & Oancea, B. (2026). *Geogr. J.*, 192(1). [10.1111/geoj.70073](https://doi.org/10.1111/geoj.70073)
- Sinha, A., Kedas, S., Kumar, R., & Malo, P. (2022). *J. Assoc. Inf. Sci. Technol.*, 73(9), 1314–1335. [10.1002/asi.24634](https://doi.org/10.1002/asi.24634)
- Jobin, M., & Siegrist, M. (2020). *Risk Analysis*, 40(5), 1058–1078. [10.1111/risa.13462](https://doi.org/10.1111/risa.13462)
- Waller, L., Cox, E., & Bellamy, R. (2023). *WIREs Climate Change*, 15(1). [10.1002/wcc.857](https://doi.org/10.1002/wcc.857)
- McLaren, D., & Corry, O. (2021). *WIREs Climate Change*, 12(3). [10.1002/wcc.707](https://doi.org/10.1002/wcc.707)
- Carton, W., Asiyanbi, A., Beck, S., Buck, H. J., & Lund, J. F. (2020). *WIREs Climate Change*, 11(6). [10.1002/wcc.671](https://doi.org/10.1002/wcc.671)

---

_Results retrieved by Scholar Gateway · Summary generated by AI — verify claims against source documents · Last corpus update: February 2026_

---

<!-- AUTO 2026-04-25 phase-4 -->
::: {.under-review}

### Domain-specific lexicons vs. VADER: methodology for climate-tech sentiment _(added 2026-04-25)_

A key methodological question for Chapter 5 is whether VADER — designed for social-media text — produces valid sentiment scores on formal news coverage of climate technologies. Barbaglia et al. (2025) provide a directly relevant benchmark: they constructed an Economic Lexicon (EL) of 7,295 human-annotated terms specifically for economic text, and showed in systematic comparisons that domain-specific lexicons outperform VADER and VADER-extended approaches on economic news corpora [@barbaglia2024lexicon]. Their lexicon was developed through a crowd-annotation process (10 annotators) assigning scores on a [−1, 1] scale, with inter-rater reliability checks, and achieves superior coverage of domain-relevant compound terms (e.g., "quantitative easing", "fiscal consolidation"). The method is directly analogous to the challenge Chapter 5 faces: climate-technology vocabulary (e.g., "carbon capture", "solar radiation management", "nature-based solutions") contains domain-specific terms that VADER's social-media lexicon may encode with neutral or incorrect polarity. This study motivates a sensitivity analysis in which Chapter 5 compares VADER compound-word handling against a climate-lexicon extension, or at minimum validates VADER scores against human-coded headlines for a stratified sample of climate-technology categories. The Barbaglia et al. framework is also methodologically relevant because it separates *coverage* (fraction of tokens matched) from *sentiment accuracy* — both dimensions should be reported in Ch5's validation section.

:::

## References (2026-04-25 phase-4)

- Barbaglia, L., Consoli, S., Manzan, S., Tiozzo Pezzoli, L., & Tosetti, E. (2025). *Economic Inquiry*, 63(1), 125–143. [10.1111/ecin.13264](https://doi.org/10.1111/ecin.13264)

_Results retrieved by Scholar Gateway · Summary generated by AI — verify claims against source documents · Last corpus update: February 2026_

---

<!-- AUTO 2026-04-18 phase-1 -->
::: {.under-review}
Computational approaches to tracking public and media sentiment toward climate technology interventions have grown substantially in methodological sophistication. Tashakori et al. [@tashakori2025nlp] provide a PRISMA-guided review of 131 NLP studies across sustainability research (2018–2025), finding that the dominant theme couples public sentiment monitoring toward climate policy with innovation trajectory detection in low-carbon technologies — positioning large-scale sentiment analysis as a real-time feedback mechanism for SDG implementation. At the level of specific climate interventions, Biermann et al. [@biermann2022solar] argue that solar geoengineering is ungovernable within the current international system and advocate for a non-use agreement, a governance framing that shapes how solar radiation management (SRM) coverage in news corpora should be interpreted: sustained media attention to SRM need not reflect public acceptance. Low and Buck [@low2020responsible] review how responsible research and innovation (RRI) frameworks have been applied to both carbon removal and sunlight reflection methods, finding that RRI activities frequently enable rather than constrain particular climate interventions — a critical lens relevant when evaluating the tone and framing of intervention-specific media coverage. On methods, Vågerö et al. [@vagero2024wind] demonstrate that NLP-based sentiment classification of Twitter data (NorBERT) can resolve spatio-temporal variation in public attitudes toward wind energy deployment, a design directly analogous to the GDELT-based framework in Chapter 5; their finding that sentiment negativity intensified in 2018–2020 aligns with documented periods of heightened renewables opposition in Europe and validates the temporal granularity achievable with corpus-scale sentiment analysis [@hutto2014vader].
:::

## References (2026-04-18 additions)

- Tashakori, E., Sobhanifard, Y., Aazami, A., & Khanizad, R. (2025). *Sustainable Development*, 34(1), 1350–1377. [10.1002/sd.70319](https://doi.org/10.1002/sd.70319)
- Vågerö, O. et al. (2024). *Wind Energy*, 27(6), 583–611. [10.1002/we.2902](https://doi.org/10.1002/we.2902)
- Low, S., & Buck, H. J. (2020). *WIREs Climate Change*, 11(3). [10.1002/wcc.644](https://doi.org/10.1002/wcc.644)
- Biermann, F. et al. (2022). *WIREs Climate Change*, 13(3). [10.1002/wcc.754](https://doi.org/10.1002/wcc.754)

_Results retrieved by Scholar Gateway · Summary generated by AI — verify claims against source documents · Last corpus update: February 2026_

<!-- AUTO 2026-04-23 phase-4 -->
::: {.under-review}
Two recent contributions from outside the GDELT/VADER methodological core of Ch5 nonetheless provide useful comparative and thematic context. Liu et al. [@liu2025discourse] conduct a 2013–2025 diachronic analysis of climate change discourse in *China Daily* and *The New York Times* using Usage Fluctuation Analysis combined with Critical Discourse Analysis, finding that the two outlets adopt systematically different framings: *China Daily* foregrounds solution-oriented narratives with terms like "carbon neutrality" and "net-zero," while *The New York Times* employs more danger- and accountability-oriented language; both show discourse punctuated by political events (e.g., US withdrawal from the Paris Agreement, China's carbon neutrality pledge). While this study does not use VADER or GDELT, its outlet-level framing comparison provides a reference point for Ch5's cross-topic sentiment analysis — the possibility that lexicon-based sentiment scores are partly capturing outlet-level framing differences rather than topic-specific sentiment warrants attention in the Ch5 methodology. Freeman [@freeman2025nbs] draws on political ecology scholarship to argue that nature-based carbon removal (NbS) shares problematic assumptions with mainstream environmental conservation that often ignores social relations; this normative critique of NbS framing is directly relevant to Ch5's question of how NbS is framed in global media relative to CDR and SRM — the academic framing debates may precede and shape the media narratives Ch5 tracks. ⚠ relevance uncertain for Liu et al. 2025 (not NLP/GDELT); tag for Cali to verify before citing.
:::

## References (2026-04-23 phase-4)

- Liu, Y. et al. (2025). *Sociology Compass*, 19(11). [10.1111/soc4.70140](https://doi.org/10.1111/soc4.70140) ⚠ relevance uncertain
- Freeman, S. (2025). *WIREs Climate Change*, 16(5). [10.1002/wcc.70024](https://doi.org/10.1002/wcc.70024)

_Results retrieved by Scholar Gateway · Summary generated by AI — verify claims against source documents · Last corpus update: February 2026_

<!-- AUTO 2026-04-26 phase-1 -->
::: {.under-review}
The OAE sentiment analysis work completed today — ten figures and seven statistical tests applied to the OAE sub-corpus — benefits from contextualisation against the emerging scientific literature on ocean-based CDR. Roberts et al. [@roberts2026climate] provide a 2026 *Reviews of Geophysics* synthesis of climate interventions' potential marine ecosystem impacts, noting that Ocean Alkalinity Enhancement seeks to exploit the ocean's natural alkalinity pump — its primary multi-millennial carbon thermostat — through deliberate addition of alkaline materials or electrochemical manipulation. Their review underscores that substantial knowledge gaps persist regarding OAE's ecosystem trade-offs at scale, and that even upper-bound estimates of coastal OAE deployment (~30 Tmol A_T yr⁻¹) may be significantly offset by natural carbonate feedbacks. For Ch5's sentiment analysis, this scientific uncertainty context matters: if OAE remains a nascent technology with actively contested risk profiles in the peer-reviewed literature, the positive media reach bias detected in the GDELT corpus may partly reflect boosted coverage from technology demonstration projects and corporate communications, rather than an organic public sentiment trend. Disentangling "hype-driven" positivity from evidence-based coverage is a methodological challenge that warrants explicit discussion in the Ch5 results.
:::

## References (2026-04-26 phase-1)

- Roberts, K. E. et al. (2026). *Rev. Geophys.*, 64(1). [10.1029/2024RG000876](https://doi.org/10.1029/2024RG000876)

_Results retrieved by Scholar Gateway · Summary generated by AI — verify claims against source documents · Last corpus update: February 2026_
