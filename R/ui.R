ui <- dashboardPage(
  title = "Linkage",
  skin = "blue",
  header = dashboardHeader( # disable = TRUE,
    title = shiny::tags$a(img(
      src = "Linkage.png", height = 50
    )),
    titleWidth = 300
  ),
  sidebar = shinydashboard::dashboardSidebar(
    width = 300,
    fluidRow(column(
      12,
      sidebarMenu(
        id = "inTabset",
        menuItem(
          "Home Module",
          tabName = "home",
          icon = icon("home", lib = "glyphicon")
        ),
        menuItem(
          "Regulatory Peaks Search Module",
          tabName = "one",
          icon = icon("th", lib = "glyphicon")
        ),
        menuItem(
          "Regulatory Peaks Visualization Module",
          tabName = "tow",
          icon = icon("glyphicon glyphicon-equalizer", lib = "glyphicon")
        ),
        menuItem(
          "Regulatory Peaks Annotation Module",
          tabName = "three",
          icon = icon("glyphicon glyphicon-stats", lib = "glyphicon")
        ),
        menuItem(
          "Cis-Regulatory Elements Detection Module",
          tabName = "four",
          icon = icon("glyphicon glyphicon-list-alt", lib = "glyphicon")
        ),
        menuItem(
          # HTML("<div>&nbspRegulatory Networks Module</div>"),
          "Gene Regulatory Network Module",
          tabName = "five",
          icon = icon("glyphicon glyphicon-certificate", lib = "glyphicon")
        ),
        menuItem(
          "Pathway Enrichment Analysis Module",
          tabName = "six",
          icon = icon("glyphicon glyphicon-object-align-bottom", lib = "glyphicon")
        ),
        menuItem(
          "Help",
          tabName = "help",
          icon = icon("glyphicon glyphicon-question-sign", lib = "glyphicon")
        ),
        menuItem(
          "About",
          tabName = "about",
          icon = icon("glyphicon glyphicon-info-sign", lib = "glyphicon")
        )
      )
    )),
    # shiny::tags$head(
    #   shiny::tags$script(src="getIP.js")
    # ),

    shiny::tags$head(
      shiny::tags$style(
        HTML(
          "
    .skin-blue .main-sidebar .sidebar-menu > li > a[data-value='home'] {
            font-size: 13px
    }
    .skin-blue .main-sidebar .sidebar-menu > li > a[data-value='one'] {
            color: #808080; /* 灰色 */
            font-size: 13px
    }


    .skin-blue .main-sidebar .sidebar-menu > li > a[data-value='tow'] {
            color: #808080; /* 灰色 */
            font-size: 13px
      }

    .skin-blue .main-sidebar .sidebar-menu > li > a[data-value='three'] {
            color: #808080; /* 灰色 */
            font-size: 13px
      }

    .skin-blue .main-sidebar .sidebar-menu > li > a[data-value='four'] {
            color: #808080; /* 灰色 */
            font-size: 13px
      }

    .skin-blue .main-sidebar .sidebar-menu > li > a[data-value='five'] {
            color: #808080; /* 灰色 */
            font-size: 13px
    }

    .skin-blue .main-sidebar .sidebar-menu > li > a[data-value='six'] {
            color: #808080; /* 灰色 */
            font-size: 13px
    }

    .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
            background-color: #434C5E;
            font-size: 13px
    }
    .skin-blue .main-sidebar .sidebar-menu > li > a[data-value='Help'] {
            font-size: 13px
    }
    .skin-blue .main-sidebar .sidebar-menu > li > a[data-value='About'] {
            font-size: 13px
    }

    .skin-blue .main-sidebar {
        position: fixed;
        width: 300px;
      }

    .skin-blue .sidebar {
        position: fixed;
        top: 50px;
        bottom: 0;
        width:300px;
    }


      /*固定标题*/
    .skin-blue .main-header .logo{
        position: fixed;
        height: 50px;
        width: 300px;
      }
    .skin-blue .navbar-static-top {
        position: fixed;
        width: 100%;
    }
      
    # .custom-popover .popover {
    #   width: 300px ;
    # }


"
        )
      )
    )
  ),
  body = dashboardBody(
    shinyjs::useShinyjs(),
    fresh::use_theme(mytheme),
    shiny::tags$div(style = "height: 50px;"),
    # <-- use the theme
    tabItems(
      # First tab content
      tabItem(
        tabName = "home",
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("window-restore"), "Overview"),
            width = 8,
            height = 730,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            # fluidRow(column(
            #   12,
            #   align = "left",
            #   shiny::tags$img(src = "shiny-logo1.png", style = "max-height:120px; width:auto;max-width:100%;")
            # )
            # column(
              # 10,
              # div("An R shiny web server for", strong("link"),"ing of",strong("A"),"TAC-seq to",strong("g"),"ene", strong("e"),"xpression data",
              #   align = "justify",style = "font-size:30px;font-style:calibri;color:black;margin-top:10px"
              # )
              # div("An R shiny web server for linking of ATAC-seq to gene expression data",
              #     align = "justify",style = "font-size:30px;font-style:calibri;color:black;margin-top:10px;color: #0093af;"
              # )
            # )
            # ),
            
            
            fluidRow(column(
              12,
              align = "center",
              shiny::tags$img(src = "Pipeline.png", style = "max-height:650px; width:auto;max-width:100%;")
            )),
          ),
          # shinydashboard::box(title = "Data Select", width = 4, solidHeader = F, status = "primary", collapsible = TRUE,
          column(
            4,
            shinydashboard::box(
              title = tagList(icon("gears"), "Import Data"),
              width = NULL,
              height = 730,
              solidHeader = F,
              status = "primary",
              selectInput(
                inputId = "data",
                label = "Datasets",
                choices = list(
                  "TCGA Breast Cancer cohort" = 1,
                  "GSE121589" = 2,
                  "Custom data" = 3
                ),
                selected = 1
              ),
              shiny::tags$style(
                ".btn-two {background-color:  #E6E7E8; color: black;box-shadow: inset 0px 2px 5px #888888;}",
                ".btn-one.active {background-color: #017351; color: white;box-shadow: inset 0px 2px 5px #888888;}",
                ".btn-one {background-color:  #E6E7E8; color: black;box-shadow: inset 0px 2px 5px #888888;}",
                ".btn-two.active {background-color: #017351; color: white;box-shadow: inset 0px 2px 5px #888888;}"
              ),
              # br(),
              fluidRow(column(
                12,
                radioGroupButtons(
                  inputId = "Species",
                  label = "Species",
                  choiceValues = c( #' Markdown',
                    1,
                    2
                  ),
                  choiceNames = c( #' Markdown',
                    "Homo sapiens",
                    "Mus musculus"
                  ),
                  justified = TRUE,
                  status = c("one", "two")
                )
              )),
              # br(),
              uiOutput("Fileinput"),
              # br(),
              uiOutput("datahelptext"),
              br(),
              # div(actionButton("submit", "Do analysis"))
              do.call(actionBttn, c(
                list(
                  inputId = "submit",
                  label = "START",
                  icon = icon("play")
                ),
                actionBttnParams
              ))
            )
          ),
          shiny::tags$style(
            "#submit {box-shadow: 0px 2px 5px #888888;}"
          ),
          shiny::tags$style(
            "#ATAC_data {background-color: white; color: black;margin-top: 10%;margin-left:70%}"
          ),
          shiny::tags$style(
            "#RNA_data {background-color: white; color: black;margin-top: 10%;margin-left:70%}"
          )
        ),
        fluidRow(
          shinydashboard::box(
            column = 12,
            title = tagList(icon("flask"), "Instruction"),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            fluidRow(column(12, helpText(
              div(
                code("Linkage"),
                "is a user-friendly, interactive, open-source R-Shiny web application for",
                code("exploring and visualizing potential gene cis-regulatory elements (CREs)"),
                "based on ",
                strong("ATAC-seq"),
                " and",
                strong("RNA-seq"),
                "Users can upload customized data or re-analysze public datasets, then obtain genome-wide CREs with simple clicks. All the CREs are predicted from multi-omics sequencing data, rather than being experimentally determined.",
                code("The main feature of Linkage"), "is to identify potential CREs for the whole genome by",
                code("performing a canonical correlation analysis"),
                "between chromatin accessibility and gene expression from the same sample.",
                code("Additional modules"), "are developed to allow users to",
                code("perform deeper and more systematic analyses for the links between ATAC-seq peaks and target genes"), ".",
                style = "font-size:17.5px;font-style:calibri;color:black;",
                align = "justify"
              )
            )))
          )
        ),
        fluidRow(
          shinydashboard::box(
            column = 12,
            title = tagList(icon("table"), "RNA-seq Data"),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            DT::dataTableOutput("eg_RNA") # %>% withSpinner(color = "#3c8cbc"),
          )
        ),
        fluidRow(
          shinydashboard::box(
            column = 12,
            title = tagList(icon("table"), "ATAC-seq Data"),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            DT::dataTableOutput("eg_ATAC") # %>% withSpinner(color = "#3c8cbc")
          )
        ),
      ),
      tabItem(
        tabName = "one",
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("flask"), "Instruction"),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            helpText(
              div("The",
                strong("Regulatory Peaks Search Module"), "allows users to",
                code("detect all potential regulatory DNA regions for a specific gene"), ". When given an",
                strong("input gene"), "and", strong("search scale"),
                ", Linkage automatically performs canonical correlation analysis between the quantitative expression level of the 
                input gene and each quantitative chromatin accessibility measure in the region across all samples. Users can easily 
                adjust the search scale and correlation analysis algorithm (",
                strong(" spearman / pearson / kendall"), "). Then, all the statistically significant results are listed in the",
                code("Potential Cis-regulatory Regions panel"), ". By clicking on a specific entry of this panel, users can view 
                the scatter plot of quantitative chromatin accessibility and gene expression from the", code("Correlation Plot panel"),
                ". The corresponding", strong("rho"), "and", strong("FDR"), "for the correlation analysis will also be shown on the scatter plot.",
                style = "font-size:17.5px;font-style:calibri;color:black;",
                align = "justify"
              )
            )
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("gears"), "Search"),
            shiny::tags$style(".popover {max-width: 500px; /* 设置弹出提示框的最大宽度 */} "),
            width = 12,
            height = 230,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            fluidRow(
              column(
                4,
                selectInput(
                  inputId = "geneid_method",
                  label = "Gene ID type",
                  choices = list(
                    "ENSEMBL",
                    "SYMBOL",
                    "ENTREZ"
                  ),
                  selected = "SYMBOL"
                )
              ),
              column(
                4,
                textInput("geneid",
                  label = "Gene ID",
                  value = "ENSG00000000419"
                )
              ),
              
              column(
                4,
                splitLayout(cellWidths = c("92%","8%"), 
                numericInput(
                  "bins",
                  label = "Search scale",
                  value = 500000,
                  max = 1000000,
                  min = 0,
                  step = 1000,
                ),
                bsButton('v_bs',label = '',icon = icon(name = 'question'),size = 'extra-small'),
                bsPopover(id = 'v_bs',title=NULL,
                          content ='Since promoter capture Hi-C (PCHi-C) data suggested that >75% of three-dimensional (3D) promoter-based interactions occur within a 500 kilobase pairs (kbp) distance (Javierre, et al., 2016), we set the default search scale to 500 kbp upstream or downstream of the input gene&#39;s TSS as potential regulatory regions. This default search scale can avoid spurious predictions. To enable users to explore interactions between distal ATAC-seq peaks and genes, Linkage supports the maximum search scale up to 1 million base pairs (Mbp).',
                          placement = 'bottom',trigger = 'hover',options = list(container = 'body'))
                )
              ),
              # column(
              #   4,
              #   selectInput(
              #     inputId = "filter_method",
              #     label = "Fliter type",
              #     choices = list("p_value",
              #                    "FDR",
              #                    "rho"),
              #     selected = "FDR"
              #   ),
              # )
            ),
            fluidRow(
              # column(
              #   4,
              #   textInput("geneid",
              #             label = "Gene input",
              #             value = "ENSG00000000419")
              # ),
              column(
                4,
                selectInput(
                  inputId = "method",
                  label = "Correlation method",
                  choices = list(
                    "pearson" = 1,
                    "spearman" = 2,
                    "kendall" = 3
                  ),
                  selected = 2
                )
              ),
              column(
                4,
                selectInput(
                  inputId = "filter_method",
                  label = "Statistical measure",
                  choices = list(
                    "p_value",
                    "FDR",
                    "rho"
                  ),
                  selected = "FDR"
                ),
              ),
              column(
                4,
                splitLayout(cellWidths = c("92%","8%"),
                numericInput(
                  "value",
                  label = "Threshold",
                  value = "0.05",
                  max = 1,
                  min = 0,
                  step = 0.01
                ),
                bsButton('value_bs',label = '',icon = icon(name = 'question'),size = 'extra-small'),
                bsPopover(id = 'value_bs',title=NULL,
                          content ='The threshold of statistical measures',
                          placement = 'bottom',trigger = 'hover',options = list(container = 'body'))
              ))
            )
          ),
          shinydashboard::box(
            title = tagList(icon("table"), "Target Gene Information Table"),
            width = 12,
            height = 200,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            DT::dataTableOutput("RNA")
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("table"), "Potential Regulatory Peaks Table"),
            width = 7,
            height = 530,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            DT::dataTableOutput("ATAC") %>% withSpinner(color = "#3c8cbc"),
            fluidRow(
              column(
                3,
                radioButtons(
                  inputId = "extTable",
                  label = helpText("Output Format"),
                  choices = c("CSV" = "csv", "TXT" = "txt"),
                  inline = T
                )
              ),
              column(
                3,
                div(
                  downloadButton("tableDown", "Download"),
                  shiny::tags$style(
                    "#tableDown {background-color: white; color: black; margin-left: 0%; margin-top:25px; box-shadow: inset 0px 1px 2.5px #888888;}"
                  )
                )
              ),
              column(
                6,
                uiOutput("next_1"),
                shiny::tags$style("#submit2 {margin-top: 25px;margin-right: 0%;box-shadow: 0px 2px 5px #888888;}"),
              )
            )
          ),
          shinydashboard::box(
            title = tagList(icon("chart-column"), "Correlation Plot"),
            width = 5,
            height = 530,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            plotlyOutput(outputId = "displot") %>% withSpinner(color = "#3c8cbc"),
            fluidRow(
              column(
                6,
                radioButtons(
                  inputId = "extPlot",
                  label = helpText("Output Format"),
                  choices = c(
                    "PNG" = "png",
                    "PDF" = "pdf",
                    "JPEG" = "jpeg"
                  ),
                  inline = T
                )
              ),
              column(
                6,
                downloadButton("plotDown", "Download"),
                shiny::tags$style(
                  "#plotDown {background-color: white; color: black;margin-top: 10%;box-shadow: inset 0px 1px 2.5px #888888;}"
                )
              )
            )
          )
        )
      ),
      tabItem(
        tabName = "tow",
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("flask"), "Instruction"),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            helpText(
              div("The",
                strong("Regulatory Peaks Visualization Module"), "allows users to",
                code("visualize the coverage of mapped ATAC-seq reads around a given specific regulatory peak, 
                     as well as the corresponding quantitative expression of the target gene of this regulatory peak"),
                ". Users initially", strong("select a regulatory peak"),
                "that is obtained from the Regulatory Peaks Search Module. Linkage then categorizes samples into five groups 
                based on the quantitative chromatin accessibility of the specific regulatory peak, ranging from low to high for each sample. The",
                strong("coverage track of mapped ATAC-seq reads"), "and the", strong("expression boxplot of the target gene"),
                "for each group will be shown simultaneously.",
                style = "font-size:17.5px;font-style:calibri;color:black;",
                align = "justify"
              )
            )
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("table"), "Target Gene Information Table"),
            width = 12,
            height = 200,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            DT::dataTableOutput("RNA2")
          ),
          shinydashboard::box(
            column = 12,
            align = "center",
            title = tagList(icon("gears"), "Selection of Regulatory Peaks",
                            bsButton('bs2',label = '',icon = icon(name = 'question'),size = 'extra-small'),
                            bsPopover(id = 'bs2',title=NULL,
                                      content ='Since generating an ATAC-seq Trackplot requires accessing gene annotation databases, the initial plotting may incur a slightly longer wait time. However, subsequent plotting to other specific peaks of interest can be completed within seconds.',
                                      placement = 'right',trigger = 'hover',options = list(container = 'body'))),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            DT::dataTableOutput("ATAC2") %>% withSpinner(color = "#3c8cbc"),
            uiOutput("next_2"),
            shiny::tags$style("#submit3 {margin-top: 10%;margin-left:170%;box-shadow: 0px 2px 5px #888888;}"),
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("chart-column"), "ATAC-seq Trackplot"),
            width = 6,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            plotOutput(outputId = "displot2") %>% withSpinner(color = "#3c8cbc"),
            fluidRow(
              column(
                6,
                radioButtons(
                  inputId = "extPlot2",
                  label = helpText("Output Format"),
                  choices = c(
                    "PNG" = "png",
                    "PDF" = "pdf",
                    "JPEG" = "jpeg"
                  ),
                  inline = T
                )
              ),
              column(
                6,
                downloadButton("plotDown2", "Download"),
                shiny::tags$style(
                  "#plotDown2 {background-color: white; color: black;margin-top: 10%;box-shadow: inset 0px 1px 2.5px #888888;}"
                )
              )
            )
          ),
          shinydashboard::box(
            title = tagList(icon("chart-column"), "RNA-seq Boxplot"),
            width = 6,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            plotlyOutput(outputId = "displot3") %>% withSpinner(color = "#3c8cbc"),
            fluidRow(
              column(
                6,
                radioButtons(
                  inputId = "extPlot3",
                  label = helpText("Output Format"),
                  choices = c(
                    "PNG" = "png",
                    "PDF" = "pdf",
                    "JPEG" = "jpeg"
                  ),
                  inline = T
                )
              ),
              column(
                6,
                downloadButton("plotDown3", "Download"),
                shiny::tags$style(
                  "#plotDown3 {background-color: white; color: black;margin-top: 10%;box-shadow: inset 0px 1px 2.5px #888888;}"
                )
              )
            )
          )
        )
      ),
      tabItem(
        tabName = "three",
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("flask"), "Instruction"),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            helpText(
              div("The",
                strong("Regulatory Peaks Annotation Module"), "allows users to",
                code("visualize the annotation of the predicational regulatory peaks for genes that are given in the previous module"), ". Once users click",
                strong("'Annotate Regulatory Peaks'"), ", Linkage will perform the annotation of all predicational regulatory peaks in terms of genomic location
                features, including whether the peaks are in the TSS, Exon, 5' UTR, 3' UTR, Intronic, Intergenic, and the position and strand information of the 
                nearest gene of the peaks. The corresponding information is deposited in the",strong("Regulatory Peaks Annotation Table"),". Meanwhile, Linkage also produces the",
                strong("upsetplot"), "for effectively visualizing the overlaps and distribution in the annotation of peaks.", 
                style = "font-size:17.5px;font-style:calibri;color:black;",
                align = "justify"
              )
            )
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("table"), "Target Gene Information Table"),
            width = 12,
            height = 200,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            DT::dataTableOutput("RNA3")
          ),
          shinydashboard::box(
            title = tagList(icon("table"), "Regulatory Peaks Annotation Table"),
            width = 7,
            height = 555,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            fluidRow(column(
              12,
              do.call(
                actionBttn, c(
                  list(
                    inputId = "Annote",
                    label = "Annotate Regulatory Peaks",
                    icon = icon("play")
                  ),
                  actionBttnParams
                )
              ),
              br()
            )),
            shiny::tags$style(
              "#Annote {box-shadow: 0px 2px 5px #888888;}"
            ),
            DT::dataTableOutput("Peak_Annotation"),
            # %>% withSpinner(color = "#3c8cbc"),
            fluidRow(
              column(
                3,
                radioButtons(
                  inputId = "extTable2",
                  label = helpText("Output Format"),
                  choices = c("CSV" = "csv", "TXT" = "txt"),
                  inline = T
                )
              ),
              column(
                3,
                downloadButton("Download_Annotation", "Download"),
                shiny::tags$style(
                  "#Download_Annotation {background-color: white; color: black; margin-left:0%; margin-top:25px;box-shadow: inset 0px 1px 2.5px #888888;}"
                )
              ),
              column(
                6,
                uiOutput("next_3"),
                shiny::tags$style("#submit4 {margin-top:25px;box-shadow: 0px 2px 5px #888888;}")
              )
            )
          ),
          shinydashboard::box(
            title = tagList(icon("chart-column"), "Upsetplot"),
            width = 5,
            height = 555,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            plotOutput(outputId = "displot4"),
            # %>% withSpinner(color = "#3c8cbc"),
            fluidRow(
              column(
                6,
                radioButtons(
                  inputId = "extPlot4",
                  label = helpText("Output Format"),
                  choices = c(
                    "PNG" = "png",
                    "PDF" = "pdf",
                    "JPEG" = "jpeg"
                  ),
                  inline = T
                )
              ),
              column(
                6,
                downloadButton("plotDown4", "Download"),
                shiny::tags$style(
                  "#plotDown4 {background-color: white; color: black;margin-top: 10%;box-shadow: inset 0px 1px 2.5px #888888;}"
                )
              )
            )
          )
        )
      ),
      tabItem(
        tabName = "four",
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("flask"), "Instruction"),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            helpText(
              div("The",
                strong("Cis-Regulatory Elements Detection Module"), "supports users to",
                code("visualize the enriched TFBS within potential regulatory peaks"),
                ". By clicking on a specific regulatory peak, users can view the location and binding score 
                information of each enriched TFBS of this DNA region from the",
                code("Motif Scanning Table"),". Once users select one TFBS of this table, the corresponding",
                strong("sequence logo"), "of this CREs will appear in the",
                code("Sequence-logo Plot panel"), ".",
                style = "font-size:17.5px;font-style:calibri;color:black;",
                align = "justify"
              )
            )
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("table"), "Target Gene Information Table"),
            width = 12,
            height = 200,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            DT::dataTableOutput("RNA4")
          ),
          
          shinydashboard::box(
            column = 12,
            title = tagList(icon("gears"), "Selection of Regulatory Peaks"),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            DT::dataTableOutput("ATAC3") %>% withSpinner(color = "#3c8cbc"),
            uiOutput("next_4"),
            shiny::tags$style("#submit5 {margin-top: 10%;margin-left:170%;box-shadow: 0px 2px 5px #888888;}"),
          )
        ),
        fluidRow(
          shinydashboard::box(
            column = 12,
            title = tagList(icon("table"), "Motif Scanning Table "),
            width = 7,
            height = 530,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            DT::dataTableOutput("Motif") %>% withSpinner(color = "#3c8cbc"),
            fluidRow(
              column(
                3,
                radioButtons(
                  inputId = "extTable3",
                  label = helpText("Output Format"),
                  choices = c("CSV" = "csv", "TXT" = "txt"),
                  inline = T
                )
              ),
              column(
                3,
                div(
                  downloadButton("Download_Motif", "Download"),
                  # align = "center",
                  shiny::tags$style(
                    "#Download_Motif {background-color: white; color: black;margin-left:0%; margin-top:25px;box-shadow: inset 0px 1px 2.5px #888888;}"
                  )
                )
              ),
              # column(
              #   4,
              #   uiOutput("next_4"),
              #   shiny::tags$style("#submit5 {margin-top: 10%;}"),
              # )
            )
          ),
          shinydashboard::box(
            title = tagList(icon("chart-column"), "Sequence-logo Plot"),
            width = 5,
            height = 530,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            plotOutput(outputId = "displot5") %>% withSpinner(color = "#3c8cbc"),
            fluidRow(
              column(
                6,
                radioButtons(
                  inputId = "extPlot5",
                  label = helpText("Output Format"),
                  choices = c(
                    "PNG" = "png",
                    "PDF" = "pdf",
                    "JPEG" = "jpeg"
                  ),
                  inline = T
                )
              ),
              column(
                6,
                downloadButton("plotDown5", "Download"),
                shiny::tags$style(
                  "#plotDown5 {background-color: white; color: black;margin-top: 10%;box-shadow: inset 0px 1px 2.5px #888888;}"
                )
              )
            )
          )
        )
      ),
      tabItem(
        tabName = "five",
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("flask"), "Instruction"),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            helpText(
              div("The",
                strong("Gene Regulatory Network Module"), "helps users ",
                code("visualize GRNs whose nodes are represented by genes and their corresponding CREs that were inferred from previous analysis of Linkage"),
                ". First, users input a list of interested genes and TFs which was obtained from the previous analysis. Then users can customize a series of parameters in association with 
                building the GRN, including types of gene symbols, calculation methods, and thresholds of interactions between the nodes (edges of the GRNs). Once users click the", strong("'Build the GRN'"),
                "button, Linkage will perform a", code("canonical correlation analysis of the quantitative expression level between each interested gene and their potential CREs"),
                ". The significant calculation results of correlation analysis are shown in the", code("Gene-TF Table panel"),
                ". Meanwhile, Linkage produces the corresponding informatic and interactive GRNs. Users can further easily change network layouts, select subnetworks, and save the GRNs as spreadsheets with interaction score or plots.",
                style = "font-size:17.5px;font-style:calibri;color:black;",
                align = "justify"
              )
            )
          )
        ),
        fluidRow(
          shinydashboard::tabBox(
            # title = tagList(icon("gears"), "Option"),
            width = 3,
            # solidHeader = F,
            # status = "primary",
            # collapsible = TRUE,
            tabPanel(
              tagList(icon("gears"), "GRN input"),
              column(
                12,
                textAreaInput(
                  "gene_list",
                  "Gene list",
                  value =
                    "PGF
CTSB
EDN1
",
                  rows = 10
                )
              ),
              shiny::tags$style("#gene_list {resize: none;}"),
              column(
                12,
                selectInput(
                  inputId = "genelist_idtype",
                  label = "Gene ID type",
                  choices = list(
                    "ENSEMBL" = 1,
                    "SYMBOL" = 2,
                    "ENTREZ" = 3
                  ),
                  selected = 2
                )
              ),
              column(
                12,
                selectInput(
                  inputId = "TF_cor_method",
                  label = "Interactions correlation method",
                  choices = list(
                    "pearson" = 1,
                    "spearman" = 2,
                    "kendall" = 3
                  ),
                  selected = 2
                )
              ),
              column(
                12,
                selectInput(
                  inputId = "TF_filter_method",
                  label = "Statistical measure",
                  choices = list(
                    "p_value",
                    "FDR",
                    "rho"
                  ),
                  selected = "FDR"
                )
              ),
              column(
                12,
                numericInput(
                  "TF_cor_value",
                  label = "Threshold",
                  value = "0.05",
                  max = 1,
                  min = 0,
                  step = 0.01
                )
              ),
              br(),
              fluidRow(column(
                12,
                do.call(
                  actionBttn, c(
                    list(
                      inputId = "submit6",
                      label = "Build the GRN ",
                      icon = icon("play")
                    ),
                    actionBttnParams
                  )
                )
              ),
              shiny::tags$style(
                "#submit6 {box-shadow: 0px 2px 5px #888888;}"
              ))
            ),
            
            tabPanel(
              tagList(icon("cloud-arrow-up"), "Upload data",
                      bsButton('q1',label = '',icon = icon(name = 'question'),size = 'extra-small'),
                      bsPopover(id = 'q1',title=NULL,
                                content ='Since building GRNs can sometimes take a significant waiting time, Linkage allows users to upload the previously saved Gene-TF Table file or delimited text/excel files with the same structure for rebuilding the GRN, which is very time-consuming.',
                                placement = 'right',trigger = 'hover',options = list(container = 'body'))),
              fluidRow(
                column(
                  12,
                  fileInput("Network_data",
                    label = "Input data"
                  )
                ),
                column(
                  12,
                  selectInput(
                    inputId = "genelist_idtype2",
                    label = "Gene ID type",
                    choices = list(
                      "ENSEMBL" = 1,
                      "SYMBOL" = 2,
                      "ENTREZ" = 3
                    ),
                    selected = 2
                  )
                ),
                column(
                  12,
                  selectInput(
                    inputId = "TF_filter_method2",
                    label = "Statistical measure",
                    choices = list(
                      "p_value",
                      "FDR",
                      "rho"
                    ),
                    selected = "FDR"
                  )
                ),
                column(
                  12,
                  numericInput(
                    "TF_cor_value2",
                    label = "Threshold",
                    value = "0.05",
                    max = 1,
                    min = 0,
                    step = 0.01
                  )
                ),
                column(
                  12,
                  do.call(
                    actionBttn, c(
                      list(
                        inputId = "Build",
                        label = "Build the GRN",
                        icon = icon("play")
                      ),
                      actionBttnParams
                    )
                  )
                ),
                shiny::tags$style(
                  "#Build {box-shadow: 0px 2px 5px #888888;}"
                )
              )
            )
          ),
          uiOutput("Gene.TF.Table")
        ),
        fluidRow(uiOutput("visNetwork"))
      ),
      tabItem(
        tabName = "six",
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("flask"), "Instruction"),
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            helpText(
              div("The",
                strong("Pathway Enrichment Module"), "supports users to", code("visualize tabular and graphical pathway enrichment results of the interested genes/TFs"),
                "that were previously produced from other modules of Linkage. The pathway enrichment analysis can link them with underlying molecular pathways and functional 
                categories such as", strong("gene ontology (GO)"), "and", strong("Kyoto Encyclopedia of Genes and Genomes (KEGG)"), ". Within this module, users can input a 
                list of interested genes/TFs and set four key parameters (i.e., adjusted p-value cutoff, q-value cutoff, minimal size of annotated genes for testing, and 
                maximal size of annotated genes for testing) for pathway enrichment analysis. Then once users click the",strong("'Build the Pathway'"),"button, Linkage 
                automatically performs GO and KEGG enrichment analysis. The corresponding enrichment categories will be returned in the",code("GO/KEGG Enrichment Table"),". Finally, 
                Linkage implements several different visualization methods to interpret the functional results in the",code("GO/KEGG Enrichment Table"),"from multiple perspectives.",
                style = "font-size:17.5px;font-style:calibri;color:black;",
                align = "justify"
              )
            )
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = tagList(icon("gears"), "Pathway"),
            width = 3,
            # height = 350,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            column(
              12,
              textAreaInput(
                "gene_list_six",
                "Gene list",
                value =
                  "PGF
CTSB
EDN1
DKK1
FGF1
SPX
SERPINE2
IL15
IL2
PLAU
IGF1
IGFBP4
SPP1
SEMA3F
ANG
ANG
ANG
C3
BMP6
FGF2
PAPPA
IL18
ANGPT1
CCL20
VEGFC
TNF
IGFBP7
PLAT
CCL1
CCL1
IL6
CXCL12
VEGFA
CCL7
IL10
EREG
IL7
MIF
CXCL10
NRG1
CD55
CD55
IL13
ANG
ANG
CSF1
ANGPTL4
CSF2
GDF15
CCL8
WNT16
HGF
TIMP2
ESM1
MMP2
IGFBP6
MMP3
CCL4
MMP1
MMP1
IL1A
IGFBP2
IL1B
MMP12
CCL24
CXCL16
MMP13
IGFBP1
SERPINE1
IGFBP3
FGF7
CCL3L1
IGFBP5
INHA
BMP2
VGF
CCL3
MMP9",
                rows = 10
              )
            ),
            shiny::tags$style("#gene_list_six {resize: none;}"),
            column(
              12,
              selectInput(
                inputId = "six_genelist_idtype",
                label = "Gene ID type",
                choices = list(
                  "ENSEMBL" = 1,
                  "SYMBOL" = 2,
                  "ENTREZ" = 3
                ),
                selected = 2
              )
            ),
            column(
              12,
              shinyBS::popify(
                numericInput(
                  "six_p_value",
                  label = "pvalueCutoff",
                  value = 0.05,
                  max = 1,
                  min = 0,
                  step = 0.01
                ),
                title = "i.e.",
                content = "adjusted p-value cutoff.",
                placement = "right"
              )
            ),
            column(
              12,
              shinyBS::popify(
                numericInput(
                  "six_q_value",
                  label = "qvalueCutoff",
                  value = 0.2,
                  max = 1,
                  min = 0,
                  step = 0.1
                ),
                title = "i.e.",
                content = "adjusted q-value cutoff",
                placement = "right"
              )
            ),
            column(
              12,
              shinyBS::popify(
                numericInput(
                  "minGSSize",
                  label = "minGSSize",
                  value = 10,
                  max = 500,
                  min = 0,
                  step = 1
                ),
                title = "i.e.",
                content = "minimal size of annotated genes for testing",
                placement = "right"
              )
            ),
            column(
              12,
              shinyBS::popify(
                numericInput(
                  "maxGSSize",
                  label = "maxGSSize",
                  value = 500,
                  min = 500,
                  step = 1
                ),
                 title = "i.e.",
                content = "maximal size of annotated genes for testing",
                placement = "right"
              )
            ),
            br(),
            fluidRow(column(
              12,
              do.call(
                actionBttn, c(
                  list(
                    inputId = "submit7",
                    label = "Build the Pathway",
                    icon = icon("play")
                  ),
                  actionBttnParams
                )
              )
            )),
            shiny::tags$style(
              "#submit7 {box-shadow: 0px 2px 5px #888888;}"
            )
          ),
          uiOutput("Enrichment.Table")
        ),
        fluidRow(uiOutput("Enrichment.Plot"))
      ),
      tabItem(
        tabName = "help",
        fluidRow(
          shinydashboard::box(
            title = "Home Module",
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            # HTML(
            #   paste0(
            #     "</br><p style = ' font-size:17.5px; color: black;'>",
            #     "The tutorial of Linkage and corresponding R package (LinkageR) are available at ","<a  href = 'https://aicplane.github.io/Linkage' target='_blank'>this</a>  "," website.",
            #    # style = "font-size:17.5px;font-style:calibri;color:black;",
            #     #align = "justify"
            #     "</p>"
            #   )
            # )
            fluidRow(column(
              12,
              align = "center",
              shiny::tags$img(src = "001.svg", style = "max-width:100%;height:auto;")
            ))
            
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = "Regulatory Peaks Search",
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            # HTML(
            #   paste0(
            #     "</br><p style = ' font-size:17.5px; color: black;'>",
            #     "The tutorial of Linkage and corresponding R package (LinkageR) are available at ","<a  href = 'https://aicplane.github.io/Linkage' target='_blank'>this</a>  "," website.",
            #    # style = "font-size:17.5px;font-style:calibri;color:black;",
            #     #align = "justify"
            #     "</p>"
            #   )
            # )
            fluidRow(column(
              12,
              align = "center",
              shiny::tags$img(src = "2.svg", style = " max-width:100%;height:auto;")
            ))
            
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = "Regulatory Peaks Visualization Module",
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            # HTML(
            #   paste0(
            #     "</br><p style = ' font-size:17.5px; color: black;'>",
            #     "The tutorial of Linkage and corresponding R package (LinkageR) are available at ","<a  href = 'https://aicplane.github.io/Linkage' target='_blank'>this</a>  "," website.",
            #    # style = "font-size:17.5px;font-style:calibri;color:black;",
            #     #align = "justify"
            #     "</p>"
            #   )
            # )
            fluidRow(column(
              12,
              align = "center",
              shiny::tags$img(src = "3.svg", style = "max-width:100%;height:auto;")
            ))
            
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = "Regulatory Peaks Annotation Module",
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            # HTML(
            #   paste0(
            #     "</br><p style = ' font-size:17.5px; color: black;'>",
            #     "The tutorial of Linkage and corresponding R package (LinkageR) are available at ","<a  href = 'https://aicplane.github.io/Linkage' target='_blank'>this</a>  "," website.",
            #    # style = "font-size:17.5px;font-style:calibri;color:black;",
            #     #align = "justify"
            #     "</p>"
            #   )
            # )
            fluidRow(column(
              12,
              align = "center",
              shiny::tags$img(src = "4.svg", style = "max-width:100%;height:auto;")
            ))
            
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = "Cis-Regulatory Elements Detection Module",
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            # HTML(
            #   paste0(
            #     "</br><p style = ' font-size:17.5px; color: black;'>",
            #     "The tutorial of Linkage and corresponding R package (LinkageR) are available at ","<a  href = 'https://aicplane.github.io/Linkage' target='_blank'>this</a>  "," website.",
            #    # style = "font-size:17.5px;font-style:calibri;color:black;",
            #     #align = "justify"
            #     "</p>"
            #   )
            # )
            fluidRow(column(
              12,
              align = "center",
              shiny::tags$img(src = "5.svg", style = "max-width:100%;height:auto;")
            ))
            
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = "Gene Regulatory Network Module",
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            # HTML(
            #   paste0(
            #     "</br><p style = ' font-size:17.5px; color: black;'>",
            #     "The tutorial of Linkage and corresponding R package (LinkageR) are available at ","<a  href = 'https://aicplane.github.io/Linkage' target='_blank'>this</a>  "," website.",
            #    # style = "font-size:17.5px;font-style:calibri;color:black;",
            #     #align = "justify"
            #     "</p>"
            #   )
            # )
            fluidRow(column(
              12,
              align = "center",
              shiny::tags$img(src = "6.svg", style = "max-width:100%;height:auto;")
            ))
            
          )
        ),
        fluidRow(
          shinydashboard::box(
            title = "Pathway Enrichment Module",
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            # HTML(
            #   paste0(
            #     "</br><p style = ' font-size:17.5px; color: black;'>",
            #     "The tutorial of Linkage and corresponding R package (LinkageR) are available at ","<a  href = 'https://aicplane.github.io/Linkage' target='_blank'>this</a>  "," website.",
            #    # style = "font-size:17.5px;font-style:calibri;color:black;",
            #     #align = "justify"
            #     "</p>"
            #   )
            # )
            fluidRow(column(
              12,
              align = "center",
              shiny::tags$img(src = "7.svg", style = "max-width:100%;height:auto;")
            ))
            
          )
        )
        
        
        # includeMarkdown("README.md")
        # htmlOutput("inc")
        # includeHTML("README.html")
      ),
      tabItem(
        tabName = "about",
        fluidRow(
          shinydashboard::box(
            title = "About",
            width = 12,
            solidHeader = F,
            status = "primary",
            collapsible = TRUE,
            HTML(paste0(
              "<p style = ' font-size:17.5px; color: black;'>",
              "<b>Contact</b>",
              "<br>If you have any technical or collaboration needs, please contact:",
              "<br>Siwen Xu (siwxu@gdpu.edu.cn)",
              "<br>Zenghui Liu (2470587020@qq.com)",
              "</p>",
              "<br><p style = ' font-size:17.5px; color: black;'>",
              "<b>Code Availability</b>",
              "<br>The source code for Linkage can be found in ","<a  href = 'https://github.com/aicplane/Linkage' target='_blank'>this</a>"," repository.",
              "</p>",
              "<br><p style = ' font-size:17.5px; color: black;'> ",
              "<b>Cite Linkage</b>",
              "<br>If you find Linkage useful in your work please cite:",
              "<br>Zenghui Liu, Shaodong Chen, Tianting Li, Chao Zhang, Yuyan Luo, Junxi Zheng, Zixiao Lu, Jin Yang, Siwen Xu. Linkage: an interactive shiny app and R package for linking of DNA regulatory peaks to genes. bioRxiv 2024.04.24.590756;doi:",
              "<a  href = 'https://doi.org/10.1101/2024.04.24.590756' target='_blank'>https://doi.org/10.1101/2024.04.24.590756</a>.",
              "</p>"
            ))
          )
        )
      )
    )
  ),
  footer = dashboardFooter(
    div(
      # class = "footer",
      img(src = "shiny-logo1.png", style = "position:absolute;bottom:0px;height:60px;align = left"),
      img(src = "yh.png", style = "position:absolute;bottom:0px;height:60px;right:0px"),
      HTML(paste0(
        "</br><p style = ' text-align: center;font-size:1.0em; color: black; line-height: 10%;'>",
        "<b>Created by</b>: XuLabGDPU | ",
        "<b>Last update</b>: October 5, 2024",
        "</p>",
        "</br><p style = 'text-align: center; font-size:1.0em; color: black; line-height: 10%;'>",
        "<b>Address</b>: No. 280, Outer Ring East Road, Panyu District, Guangzhou City, Guangdong Province, China | ",
        "<b>Postcode</b>: 511400",
        "</p>",
        "</br><p style = 'text-align: center; font-size:1.0em; color: black; line-height: 10%;'>",
        "<b>All users are granted free access to the content and resources on this website.</b> ",
        "</p>",
        "</br><p style = 'text-align: center; font-size:1.0em; line-height: 10%;'> ",
        "<a  href = 'https://github.com/aicplane/Linkage' target='_blank'>Github</a> | ",
        "<a  href = 'https://www.xulabgdpu.org.cn' target='_blank'>XuLabGDPU</a> | ",
        "<a  href = 'https://www.xulabgdpu.org.cn/signacShiny' target='_blank'>ShinySignac.UiO</a> | ",
        "<a  href = 'https://www.gdpu.edu.cn/' target='_blank'>Guangdong Pharmaceutical University</a> | ",
        "<a href='https://beian.miit.gov.cn/' target='_blank'>黑ICP备2024016624</a>",
        "</p>"
      ))
    )
  )
)
