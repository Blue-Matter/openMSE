---
date: "2021-09-20T11:35:01+06:00"
title: Annual reference points
weight: 3
---

The calculation of reference points are impacted by inter-annual variability in life-history and fishing parameters (i.e., selectivity pattern). For example, if there is large inter-annual variability in natural mortality or growth, MSY and $\text{SB}_{\text{MSY}}$ may vary significantly between years. 

## Stock-recruit relationship

In a system where the productivity is highly variable, it is important to have something constant in order to anchor the description of the system dynamics. In `openMSE`, the stock-recruit relationship is constant through both the historical and projection period of the operating model. 

Using a Beverton-Holt relationship, the age-0 recruitment $R_y$ predicted from spawning biomass $SB_y$ in year $y$ is
$$
R_y = \dfrac{\alpha SB_y}{1 + \beta SB_y}
$$

with 

$$
\alpha = \dfrac{4h^{\textrm{SR}}}{(1-h^{\textrm{SR}}) \phi^{\textrm{SR}}_0}
$$
$$
\beta = \dfrac{1}{R_0^{\textrm{SR}}}\left(\alpha - \dfrac{1}{\phi^{\textrm{SR}}_0}\right)
$$ 

> For a Ricker function, recruitment is
> $$R_y = \alpha SB_y \times \exp(-\beta SB_y)$$
> where
> $$\alpha = \dfrac{(5h^{\textrm{SR}})^{1.25}}{\phi^{\textrm{SR}}_0}$$
> $$\beta = \dfrac{\log(\alpha\phi^{\textrm{SR}}_0)}{R_0^{\textrm{SR}}\phi^{\textrm{SR}}_0}$$ 

Parameters $\alpha$ and $\beta$ are specified via the unfished recruitment parameter $R_0^{\textrm{SR}}$, steepness $h^{\textrm{SR}}$, and unfished spawners per recruit $\phi_0^{\textrm{SR}}$. Superscripts $\textrm{SR}$ explicitly denotes that these parameters are used for calculating $\alpha$ and $\beta$. Parameters $R_0^{\textrm{SR}}$ and $h^{\textrm{SR}}$ are specified in `Stock@R0` and `Stock@h`, respectively, while $\phi_0^{\textrm{SR}}$ is the mean unfished spawners per recruit over the first generation ($A_{50}$ years):

$$
\phi_0^{\textrm{SR}} = \dfrac{\sum_{y=1}^{A_{50}} \phi_{0(y)}}{A_{50}}
$$

## Annual reference points

With constant biological parameters, $\phi_{0(y)}$ is constant over all years. With time-varying parameters, annual reference points describe the asymptotic values if the population were projected in perpetuity with $\phi_{0(y)}$, $\alpha$, $\beta$. This section describes the various annual reference points, all reported in `Hist@Ref$ByYear` and `MSE@RefPoint$ByYear`, and provides a simple example of the change in direction of reference points when there is a change in natural mortality.

### Reference points using the stock-recruit relationship

Annual values of unfished reference points, including $N_{0(y)}$, $SN_{0(y)}$, $B_{0(y)}$, $SB_{0(y)}$, $VB_{0(y)}$, and $R_{0(y)}$, and steepness $h_y$ are calculated based on the intersection of the stock-recruit relationship and the recruits per spawner line in year $y$, i.e., $1/\phi_{0(y)}$.

Note that $R_{0(y)}$ here is the asymptotic unfished recruitment if fishing were zero. It would be helpful to consider $R_0^{\textrm{SR}}$ more as a parameter for calculating $\alpha$ and $\beta$, and separate this value from the dynamics implied from a change in $\phi_0$. Similarly, $h_y$ is time-varying as well, and `Stock@h` is used for calculating $\alpha$.

> $R_{0(y)} = SB_{0(y)}/\phi_{0(y)}$ where, for the Beverton-Holt function:
> $$ SB_{0(y)} = \dfrac{\alpha \phi_{0(y)} - 1}{\beta}$$
> $$ h_y = \dfrac{\alpha \phi_{0(y)}}{4 + \alpha \phi_{0(y)}}$$ 
> and, for the Ricker function:
> $$ SB_{0(y)} = \dfrac{\log(\alpha \phi_{0(y)})}{\beta} $$
> $$ h_y = 0.2 (\alpha \phi_{0(y)})^{0.8}$$ 

Annual values of MSY reference points, including $\textrm{MSY}_y$, $F_y^{\text{MSY}}$, $SB_y^{\text{MSY}}$, $B_y^{\text{MSY}}$, and $VB_y^{\text{MSY}}$, are calculated by maximizing the yield curve.

The annual spawning potential ratio at which the stock crashes is 

$$
SPR_{\textrm{crash}(y)} = (\alpha\phi_{0(y)})^{-1}
$$

and the corresponding fishing mortality $F_{\textrm{crash}(y)}$ is the value that produces $SPR_{\textrm{crash}(y)}$.

If natural mortality were to increase, asymptotic unfished and MSY reference points decrease, while $SPR_{\textrm{crash}(y)}$ increases. 

The stock can crash in the absence of fishing if $1/\phi_{0(y)} > \alpha$, in which case, unfished and MSY reference points, as well as $F_{\textrm{crash}(y)}$, go to zero, and $SPR_{\textrm{crash}(y)} = 1$.

> It is interesting to consider whether a constant stock-recruit relationship would be appropriate if the stock is heading towards a crash in the absence of fishing. After all, shouldn't the stock evolve to avoid extinction? It may depend how sudden and how intense the factors that decrease $\phi_{0(y)}$ or increase fishing mortality come about, and whether there is enough time, in terms of generations, for the stock to respond. An example of resilience would be a decrease in the age of maturity over time that increases $\phi_{0(y)}$. 
>
>Ultimately, the assumptions behind the dynamics of the operating model need to be clearly stated, and alternative projections in the absence of fishing may need to be explored in light of these extreme scenarios. Operating models are a simplication of the real-life system dynamics used to help make recommendations about how to manage the stock, and performance of such methods should be compared relative to no fishing scenarios.

### Per-recruit reference points

Yield per recruit reference points $F_{\textrm{0.1}}$ and $F_{\textrm{max}}$ and spawning potential ratio reference points ($F_{\textrm{20%}}$, $F_{\textrm{25%}}$, ..., $F_{\textrm{60%}}$) are solely calculated from $\phi_{0(y)}$.

These values increase if M increases.

## Interpretation of annual reference points

Interpretation of annual reference points is probably beyond the scope of this manual. When there is time-varying productivity, interpretation can be quite nebulous and will frequently be case-specific. It may be more helpful to describe the system in terms of regimes with one set of reference points pertaining to each regime.


