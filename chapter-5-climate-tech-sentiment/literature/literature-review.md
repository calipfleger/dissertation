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

<!-- AUTO 2026-04-30 phase-1 -->
::: {.under-review}
The methodological landscape for sentiment analysis of climate technology discourse has matured substantially in recent years. [@mullerhansen2023attention] conducted a large-scale analysis of approximately 1.5 million tweets spanning 16 greenhouse gas removal (GGR) and solar radiation management (SRM) technologies over 2006–2021, applying deep-learning sentiment and emotion classifiers alongside lexicon-based approaches. Their key finding — that carbon dioxide removal technologies elicit more positive sentiment than solar radiation management, with nature-proximate methods (e.g., afforestation) commanding the highest positive sentiment shares — provides a baseline against which the present chapter's cross-lexicon validation (VADER, AFINN, Bing Liu, NRC) can be benchmarked. The reported inter-rater agreement patterns also complement the κ≥0.70 threshold achieved in the OAE cross-lexicon validation session, suggesting that lexicon-based methods are defensible for technology-specific climate sentiment when applied with domain-appropriate preprocessing.
:::

<!-- AUTO 2026-04-30 phase-4 -->
::: {.under-review}
The social media discourse trajectory for carbon dioxide removal (CDR) technologies provides an essential benchmark for interpreting OAE-specific sentiment trends. [@repke2024cdr] tracked Twitter attention and sentiment for ten CDR methods from 2010 to 2022, finding exponential growth in attention alongside a generally positive sentiment trend — with bioenergy with carbon capture and storage (BECCS) as a notable exception. This positive trajectory for most CDR methods stands in potential tension with the more mixed reception that ocean-based interventions have historically received; comparing OAE sentiment trajectories against the broader CDR baseline established by [@repke2024cdr] and [@mullerhansen2023attention] constitutes a core analytical thread of Chapter 5.
:::

<!-- AUTO 2026-05-04 phase-1 -->
::: {.under-review}
Community attitudes toward ocean alkalinity enhancement constitute a critical but understudied backdrop for interpreting media discourse. [@nawaz2025community] conducted future-scenario workshops with coastal community members in Sequim, Washington — one of the first empirical studies of OAE public perceptions in a deployment-proximate community. Their findings reveal that community concerns extended well beyond ecological impacts: participants oriented primarily around political-economic arrangements and multiple dimensions of environmental justice. Communities expressed preference for OAE configurations involving existing infrastructure and sectors, minimal "industrialization" of coastlines, and community or Tribal ownership and oversight models. Concerns about scale were specifically articulated — one participant noted: "when we talked about it at a gigaton scale, I thought, oh, that's a lot of rocks we're putting in the ocean" — indicating that awareness of deployment scale significantly conditions public acceptance. For Chapter 5's sentiment analysis of OAE news coverage, this community-level ambivalence provides essential context: if professional media coverage systematically omits scale concerns and environmental justice framings in favour of techno-optimistic narratives, the GDELT-sourced VADER scores may overstate public support relative to situated community attitudes. Comparing the media tone captured by the present analysis with the concerns documented by [@nawaz2025community] constitutes a potential discussion thread in the Ch5 conclusions.
:::

## References (2026-05-04 phase-1)

- Nawaz, S. & Belotti, G. (2025). *Energy Research & Social Science*. [10.1016/j.erss.2025.104080](https://doi.org/10.1016/j.erss.2025.104080)

_Results retrieved via CrossRef + WebSearch fallback · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-04_

<!-- AUTO 2026-05-05 phase-4 -->
::: {.under-review}
Recent empirical work on public perception of solar geoengineering provides important context for interpreting media sentiment trajectories in Chapter 5. [@buck2025solar] conduct mixed-methods survey and interview research with US respondents, finding that public concerns cluster around institutional trust, environmental risk, and perceived inequity rather than technical unfeasibility — and that chemtrail conspiracy narratives measurably shape the information environment through which news about stratospheric aerosol injection is received. This finding has direct methodological relevance for the Chapter 5 VADER sentiment analysis: if a meaningful share of news coverage about SRM is produced in the context of conspiracy-adjacent media ecosystems, the compound sentiment scores will conflate sincere concern from informed commentary with emotionally charged misinformation. The [@buck2025solar] framework suggests that any trend toward increasingly negative SRM sentiment in the GDELT corpus after approximately 2020 should be tested against the timing of high-profile conspiracy episodes before attributing the shift to substantive policy or scientific developments.
:::

## References (2026-05-05 phase-4)

- Buck, H. J. et al. (2025). *Communications Earth & Environment*, 6, 609. [10.1038/s43247-025-02595-5](https://doi.org/10.1038/s43247-025-02595-5)

_Results retrieved via CrossRef + WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-05_

<!-- AUTO 2026-05-13 phase-4 -->
::: {.under-review}
A welfare-economics analysis of solar radiation management quantifies the categories of social harm that are systematically underrepresented in physical-science-driven governance frameworks. [@bronsther2025social] argue that standard cost-benefit evaluations of SRM focus on avoided warming damages while neglecting social costs arising from geopolitical risk, consent violations, distributional inequity, and the foreclosure of alternative mitigation pathways. For Chapter 5, this normative taxonomy is directly relevant to interpreting VADER sentiment dynamics: negative sentiment in the GDELT news corpus may reflect any combination of these social-cost categories, and aggregate compound scores will conflate distinct concerns unless the analysis is stratified by coverage type (governance, scientific, advocacy). The Bronsther & Xu framework suggests a natural annotation scheme for validating lexicon-based results against the qualitative dimensions of the SRM discourse that VADER's valence scoring cannot distinguish.
:::

## References (2026-05-13 phase-4)

- Bronsther, J. & Xu, J. (2025). *npj Climate Action*. [10.1038/s44168-025-00273-y](https://doi.org/10.1038/s44168-025-00273-y)

_Results retrieved via CrossRef + WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-13_

<!-- AUTO 2026-05-14 phase-1 -->
::: {.under-review}
The environmental-justice dimension of ocean-based carbon removal is gaining traction in the governance literature and may mediate the media sentiment dynamics that Chapter 5 tracks. [@craik2025equitable] examine the international legal basis for benefit-sharing arrangements when mCDR activities are conducted in areas beyond national jurisdiction, arguing that obligations arise when resources are finite, when technological and financial constraints shape access, and when deployment creates cross-border consequences. This legal framing is relevant to the sentiment analysis corpus in a methodological sense: if a meaningful share of news coverage after 2023 reflects governance debates about equitable mCDR deployment rather than the technology itself, compound VADER scores for OAE-tagged articles will blend institutional-legitimacy sentiment with technology-appraisal sentiment. Stratifying the corpus by coverage type (technical, policy/governance, advocacy) — as recommended by [@bronsther2025social] for SRM sentiment interpretation — would allow Chapter 5 to isolate whether observed sentiment trends are driven by scientific reporting or by the escalating international debate over who bears mCDR risks and who receives the benefits. ⚠ relevance uncertain — legal/governance focus; not NLP methodology.
:::

## References (2026-05-14 phase-1)

- Craik, N. (2025). Equitable marine carbon dioxide removal: the legal basis for interstate benefit-sharing. *Climate Policy*. [10.1080/14693062.2025.2451645](https://doi.org/10.1080/14693062.2025.2451645)

_Results retrieved via WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-14_

<!-- AUTO 2026-05-14 phase-4 -->
::: {.under-review}
Nuanced public support for carbon removal — strong overall but differentiated by method type — creates a systematic framing landscape that lexicon-based sentiment analysis may misrepresent if it treats the CDR category as homogeneous. [@bellamy2025carbon] document through UK mixed-methods survey research that support for CDR is broadly high but conditioned on perceived environmental integrity, with biological methods attracting skepticism around life-cycle emissions and land competition. This method-type differentiation in public attitudes is directly testable in the Chapter 5 GDELT corpus: a technology-sub-type stratification (NbS, biological CDR, engineered CDR, SRM) would allow Chapter 5 to test whether the media sentiment hierarchy matches the public-attitude hierarchy documented by [@bellamy2025carbon].
:::

## References (2026-05-14 phase-4)
- Bellamy, R. et al. (2025). Carbon removal support is tempered by concerns over whether biological methods are worth it. *Communications Earth & Environment*, 6, 711. [10.1038/s43247-025-02654-x](https://doi.org/10.1038/s43247-025-02654-x)

_Results retrieved via WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-14_

<!-- AUTO 2026-05-17 phase-1 -->
::: {.under-review}
The use of GDELT as a large-scale media corpus for tracking climate-topic sentiment has methodological precedent in the peer-reviewed literature. [@mudassar2025gdelt] apply GDELT's AvgTone metric to monthly news coverage from 200 countries (March 2015–March 2024), demonstrating that GDELT's tone and concern measures reliably differentiate income-group-level climate change adaptation recognition across time — and that socioeconomic and demographic covariates systematically predict cross-national variation in media framing. For Chapter 5, this multi-country validation directly supports the pipeline design decision to use GDELT AvgTone alongside VADER compound scores: both tap the same underlying emotional valence signal, and the cross-national consistency documented by [@mudassar2025gdelt] suggests that observed SRM/GGR/NbS sentiment differences in the present corpus are more likely to reflect genuine discourse differences among technology domains than artifacts of country-level media-production biases.
:::

## References (2026-05-17 phase-1)
- Mudassar, M. et al. (2025). Global trends and influential factors of climate change adaptation recognition in GDELT. *Scientific Reports*, 15, 26887. [10.1038/s41598-025-11794-1](https://doi.org/10.1038/s41598-025-11794-1)

_Results retrieved via WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-17_

<!-- AUTO 2026-05-17 phase-4 -->
::: {.under-review}
Partisan identity may be a more powerful determinant of solar geoengineering support than message framing, which has direct implications for interpreting VADER sentiment trends in the Chapter 5 GDELT corpus. [@magistro2025partisanship] demonstrate through a conjoint experiment with 2,123 American voters that alignment with the perceived political identity of an information source overwhelms any effect of message framing in shaping trust and support for SRM. If partisan cues are embedded in news coverage — as is plausible given that SRM is politically polarized — then Chapter 5's observed negative VADER compound scores for SRM-tagged articles may partially reflect the ideological valence of the publication source rather than a substantive technical or risk appraisal. A robustness check stratifying GDELT articles by source political leaning would allow Chapter 5 to test whether the SRM negativity gradient is driven by partisan-coded outlets.
:::

## References (2026-05-17 phase-4)
- Magistro, B., Debnath, R., Wennberg, P.O. et al. (2025). Partisanship overcomes framing in shaping solar geoengineering perceptions: Evidence from a conjoint experiment. *npj Climate Action*, 4, 29. [10.1038/s44168-025-00236-3](https://doi.org/10.1038/s44168-025-00236-3)

_Results retrieved via WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-17_

<!-- AUTO 2026-05-21 phase-1 -->
::: {.under-review}
Large language models offer a promising but imperfect path toward automating the framing analysis that Chapter 5's GDELT corpus demands. [@schweighofer2025framing] benchmark BERT-for-natural-language-inference (BERT-NLI) against human coders across multiple news datasets, finding that while the model successfully identifies generic media frames in some contexts, reliability varies significantly across domains — and that LLMs cannot be uniformly trusted as replacements for human annotation without prior empirical validation of agreement within the specific corpus under study. This finding has direct methodological implications for Chapter 5: deploying a BERT-NLI or GPT-based framing classifier to categorise geoengineering news coverage into Entman-style frames (problem definition, causal attribution, moral evaluation, remedy) would require a prior human-coded validation sample drawn from the SRM/GGR/NbS corpus itself, rather than relying on cross-domain transfer from general news benchmarks. The [@schweighofer2025framing] results support the current pipeline design decision to use lexicon-based sentiment scoring (VADER, AFINN, NRC) as the primary layer while reserving LLM-based framing classification for a validation subset — a two-tier approach that balances computational scalability with the domain-specific reliability requirements the committee will scrutinise.
:::

## References (2026-05-21 phase-1)
- Schweighofer, S. (2025). Towards algorithmic framing analysis: expanding the scope by using LLMs. *Journal of Big Data*, 12(1), 66. [10.1186/s40537-025-01092-y](https://doi.org/10.1186/s40537-025-01092-y)

_Results retrieved via WebSearch · Summary generated by AI — verify claims against source documents · Last corpus update: 2026-05-21_

<!-- AUTO 2026-05-22 phase-4 -->
::: {.under-review}
The GDELT database has enabled increasingly granular multi-country analyses of public and media recognition of climate change. [@mudassar2026climate] extended this line of work by developing three composite GDELT-derived indicators — sentiment, concern, and scope — applied to monthly news data from March 2015 through March 2024 across 200 countries, finding systematic differences in adaptation recognition across income groups and identifying socioeconomic, geographic, and demographic correlates. Compared to the earlier [@mudassar2025gdelt] analysis which validated AvgTone across multi-country aggregates, this 2026 companion paper disaggregates spatiotemporal patterns at the country level, providing a methodological template for the country-level stratification employed in Chapter 5's NbS/CDR/SRM comparison.
:::
