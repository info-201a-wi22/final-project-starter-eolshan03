library(shiny)
library(htmltools)
report <- tabPanel(
  "Report",
  h2("Report"),
  p("INFO-201: Technical Foundations of Informatics, Winter 2022 | The
    Information School, University of Washington"),
  p("Authors: Samira Shirazy, Rebecca Chan, Dinah Bahta and Emily Olshan"),
  p("March 9, 2022"),
  h2("Abstract"),
  p("We are concerned with how the number of homeless varies by year and region
    and how certain groups are more likely to be homeless. To address this
    concern, we plan to analyze our datasets to find trends in who is most
    likely to end up homeless and find other factors that influence
    homelessness rates. We hope that by identifying these trends, we can gain
    a better idea of which groups need help and how to best help them."),
  strong("Keywords: "),
  p("homeless, poverty, class, youth & family"),
  h2("1.0 Introduction"),
  p("In our group project, we will be analyzing the different statistics of
    homelessness in different states. The dataset is based on different
    categories like unsheltered, sheltered, and many more. Throughout our
    analysis we will be uncovering the trends between homelessness in different
    states and why they changed overtime. It’s important that we recognize this
    homeless crisis because our country lacks housing resources for
    underprivileged people. We also want to focus on how housing is an economic
    problem. Economically, we need to provide homeless people with more job
    opportunities and help build them financially so this homeless crisis won’t
    continue. By analyzing the data we will be able to use these trend to
    discuss how we can make a significant change in our housing system. We will
    also discuss how the government can financially support the homeless and
    provide them with resources to better improve themselves."),
  h2("2.0 Design Situation"),
  h3("Project Framing"),
  p("The topic of concern for our project is the homeless crisis that is
    occurring in America. The homeless crisis is currently growing because of
    the lack of resources that America provides for its citizens. One of the
    main key elements is economic because as rent and housing prices rise
    immensely, there needs to be a push for more affordable housing in American
    cities. It would be much cheaper to provide homeless people with affordable
    housing than to put them into homeless shelters."),
  h3("Human Values"),
  p("The values that are connected within our topic are fighting this homeless
    crisis to bring a sense of community. We must understand that homeless
    people are human and need to feel a sense of belonging. If America continues
    to neglect homeless people, we want to be able to fight this homeless
    crisis. Homeless people are in a constant cycle of trauma before and after
    they become homeless. If we also focus on how we can have a system that
    provides for emotional damage we can fight this homeless crisis."),
  h3("Direct and Indirect Stakeholders"),
  p("The direct stakeholders for this homeless crisis are the federal government
    and housing providers of housing and services. If the US government funds
    housing providers we will be able to build affordable housing and fight this
    crisis. The indirect stakeholders are American citizens because this
    homeless crisis can happen to anyone so it’s important that we make sure to
    have a plan if it does happen."),
  h3("Harms and Benefits"),
  p("If interventions are taken using data and technology the possible benefits
    are creating a healthier economy. As mentioned by common bond communities,
    'when people have access to quality affordable' housing options, they are 
    far less likely to face environmental threats, and far more likely to have
    enough income for healthy food options and routine medical care—ultimately
    helping them lower the risk of severe chronic health problems. By building
    these houses, the community can use the funding to build a better
    community."),
  h2("3.0 Research Questions"),
  tags$ol(
    tags$li("How can this dataset become a foundational skill to change this homeless
       crisis?"),
    tags$li("What are the trends in homeless populations by the location in regards
       to families vs. individuals?"),
    tags$li("How does the percentage of each homelessness category (unsheltered vs
       sheltered) change in each state from 2007 to 2016?")
  ),
  h2("4.0 The Dataset"),
  h3("Data Origins"),
  p("Our dataset is Point-in-Time data of homeless populations in the US from
    2007 to 2016. The CSV file came from Kaggle user ‘def love(x)’, and the data
    is credited to the HUD Exchange. The HUD Exchange is an exchange of
    information and resources surrounding homelessness in the US run by the US
    Department of Housing and Urban Development. As a department in the federal
    government, HUD serves a variety of purposes for a variety of people. These
    tasks also include organizing and providing resources to homeless
    individuals. The data is widely available and used mainly by different local
    governments and other groups supporting housing on a local level, as it is
    widely available and relatively detailed and accurate. HUD has many
    resources discussing how the collection process works in great detail. They
    also have information on their website about how the data should be
    collected to give power to the homeless communities, and emphasizes the use
    of the collected data to aid those communities."),
  h3("Data Features"),
  p("Each of the 86,529 observations represents a specific group of homeless
    individuals for an area. These groups include a variety of classifications
    including, for example, ‘Sheltered Individuals’ or ‘Unsheltered Chronically
    Homeless People in Families.’ The many groupings cover whether the
    individuals are sheltered, chronically homeless, in families, and, beginning
    in 2011, veterans. There is also an entry for each area’s total homeless
    population. The different areas that the values are reported for are
    identified by CoC names and numbers. CoC refers to Continuum of Care
    programs, which assist homeless populations in a given area and report the
    data to HUD. The CoC’s tend to correlate with counties or other groupings
    within states and are named as such. CoC numbers use the state abbreviation
    followed by a dash and a 3 digit number. Other variables reported include
    the year of the observation, the state in which the county falls and the
    number of individuals that fall into that group. Years are recorded as the
    1st of January of that year, as the data takes some time to collect and is
    reported on a yearly basis only."),
  h2("5.0 Findings"),
  tags$ol(
    tags$li("On a high level, we notice a trend of certain states consistently
            having large homeless populations. These states are California and
            Florida especially, but Texas and New York also show up often.
            These states show up the darkest on the map on any of the selected
            years, indicating the consistently large homeless population.
            Clicking through the years also reveals that for many more states,
            there were larger populations of homeless individuals in the 2010
            to 2012 range. This increased occurred over several years, peaking
            around 2012 and decreasing after that. This is represented on the
            map with darker and lighter colors."),
    tags$li("There doesn’t seem to be a trend in terms of which states have 
            higher individual sheltered homeless populations and family
            populations. Of the 6 states represented in this chart, 3 have
            higher individual populations(AL, FL, and NY) and 3 have more
            families(CA, TX, and WA). However, in the states with higher
            sheltered family populations, there are only slightly more of them
            than the individual homeless. On the other hand, individual homeless
            populations tend to lead by quite large margins when there are more
            of them than the family populations."),
    tags$li("In general, each state’s homeless population is a small piece of
            the nationwide total, suggesting that homelessness is an issue
            across the United States. The largest states we identified earlier
            (CA, FL, TX, and NY) do make up a big portion of this, but they are
            still relatively small compared to the nation total. In addition,
            looking at each state over time, there tends to be an increase in
            the homeless populations, that peaks around 2011 or 2012. This is
            mirrored in the national trend. The exception to this is
            Massachusetts and New York, which have been increasing throughout
            the graph. This could also explain the second peak on the national
            trend line which occurs in 2015, the second to last year displayed
            in the graph.")
  ),
  h2("6.0 Discussion"),
  p("In our investigations, we were able to answer our research questions,
    mainly focusing on individual states and the changes in their homeless
    population. We looked at changes over time, as well as the different
    experiences of homelessness and discovered some trends as discussed
    above."),
  p("More specifically, our findings show what populations of homeless are most
    common and thus where we need to focus our efforts in helping those
    individuals. For example, we know that states such as California and
    Florida have large homeless populations. We also know that individuals
    are more often sheltered than individuals in families. However, there is
    also some fluctuation and ranges in terms of where there is most need and
    what sorts of trends there are. We were not able to fully identify some of
    the changes over time, for example, and that information could help us to
    identify more of the causation behind the trends we are seeing. We know that
    there was an increase in homelessness around 2012 and again around 2016, and
    more investigation could help us to determine what may be behind those
    peaks, which could help us more directly combat homelessness. In addition,
    there is a lot of differences between states. For example, Maine has the
    highest percentage of sheltered homeless at 96% while Puerto Rico has the
    least (21%). That is just one example of the large differences between
    states. Further investigation of these types of differences could tell us
    which states need the most assistance and to identify strategies that are
    working. There are many questions that still need to be answered, but we
    hope that this is a starting point as to what we could consider."),
  p("Overall, we believe that there are many who are experiencing homelessness
    and who we have a responsibility to help. The information gleaned from this
    data is important as a starting point, both for where we can direct our
    efforts right now and for suggesting further investigations into the data
    around homelessness. While we were able to learn some new information, we
    are very interested in what may come of the starting points that we have
    suggested."),
  h2("7.0 Conclusion"),
  p("While we’ve been able to identify some trends in the data such as the rise
    in homeless population in 2011, there are still a lot of questions left
    unanswered. We hope that our introductory researchhas shown how much there
    is left to learn still and encourages others to further investigate what can
    be done for homeless communities across the US. Everyone deserves housing,
    but our research has shown is that there are many, many individuals who are
    without. Further understanding of homeless populations and trends will allow
    us to do better by them."),
  h2("Acknowledgements"),
  p("We would like to thank our professor, David G Hendry for giving us the
    freedom to choose our own topic of interest to research. We would also like
    to give thanks to our teaching assistant, Meher Singh Seera for introducing
    us to the project and helping with our initial research. Lastly, we’d like
    to thank the contributors in the Homelessness data set for giving us data to
    base our report on."),
  h2("References"),
  tags$ol(
    tags$li("Appelbaum, Binyamin. “America’s Cities Could House Everyone If They
       Chose To.” The New York Times, A.G. Sulzberger, 15 May 2020,
       https://www.nytimes.com/2020/05/15/opinion/sunday/homeless-crisis-affordable-housing-cities.html."),
    tags$li("Communities, Author: CommonBond. “6 Ways Affordable Housing Can Boost 
       Local Economies.” CommonBond Communities, 13 July 2021,
       https://commonbond.org/economic-benefits-of-affordable-housing/."),
    tags$li("Constant, Paul. “Why Mental Health and Social Services Are as Crucial as
       Physical Shelter to Address the Homelessness Crisis.” Business Insider,
       Business Insider, 27 Nov. 2021, https://www.businessinsider.com/how-to-fix-america-homelessness-crisis-pitchfork-economics-2021-11."),
    tags$li("Exchange, HUD. 'Homelessness Count-USA: Anchorage Open Data.'
       Municipality of Anchorage Open Data, 8 Feb. 2017,
       https://data.muni.org/Housing-and-Homelessness/Homelessness-Count-USA/vrsm-k79r."),
    tags$li("HUD. “About Page.” HUD Exchange, n.d., https://www.hudexchange.info/about/."),
    tags$li("HUD. “Continuum of Care (COC) Program.” HUD Exchange, n.d., https://www.hudexchange.info/programs/coc/."),
    tags$li("Lavery, Diana. “Point in Time Counts of Homeless Populations by
       Continuum of Care (CoC) Area.” Georgia COVID-19 Data Hub, 18 Mar. 2019,
       https://covid-hub.gio.georgia.gov/datasets/73ef2a56092440df9f462566c7e13a93/explore?location=5.624827%2C0.315564%2C1.88&showTable=true."),
    tags$li("Love(X):, Def. “Homelessness.” Kaggle, 7 Aug. 2017, https://www.kaggle.com/adamschroeder/homelessness/version/5?select=Population-by-state.csv.")
  )
)


