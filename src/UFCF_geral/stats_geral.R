library(dplyr)
library(tidyr)
library(stringr)
library(readr)
library(ggplot2)
library(tibble)
library(purrr)
library(viridis)
library(directlabels)
library(reshape2)

names(stat_geral)[1:5] <- c(
  'Ano', 'Alunos Matriculados', 'Professores', 'Ingressantes', 'Graduados')

base <- read.delim(
  file = "~/Documentos/stat_geral.csv", encoding = "UTF-8", sep = ";")

base <- stat_geral

base$`Alunos Matriculados` <- NULL

base <- melt(base, id.vars = 'Ano')

base$Ano <- as.factor(as.character(base$Ano))


####Plotagem de Gráficos####

ggplot(data = base,
       mapping = aes(
         x = Ano,
         y = value,
         group = variable,
         Col = Ano,
         label = value,
         colour = variable)) +
  theme(panel.background = element_rect(fill="black"),
        plot.title = element_text(colour = "grey65"),
        plot.background = element_rect(fill="black"),
        panel.grid.major = element_line(colour ="grey65"),
        panel.grid.minor = element_blank(),
        axis.ticks = element_line(color="grey65"),
        axis.text = element_text(color="grey65"),
        axis.title = element_text(color="grey65"),
        axis.line = element_line(color="white"),
        axis.text.x = element_text(angle = 75, vjust = .5),
        legend.position="none") +
  scale_y_continuous(breaks = c(seq(0, max(base$value, na.rm = T) + 400, 400))) +
  coord_cartesian(xlim = c(1.6, 40), ylim = c(1.6, 3600)) +
  geom_dl(
    aes(label = variable),
    method = list(list(dl.trans(x = x + 0.15), cex = 1.5, "last.points"))) +
  ggtitle('Perfil Geral da UFCG Desde Sua Criação') +
  ylab('') +
  xlab('Período') +
  geom_line(size = 1) +
  geom_point(size = 1.8)



base <- base[,-c(3:5)]
base <- melt(base, id.vars = 'Ano')


ggplot(data = base,
       mapping = aes(
         x = Ano,
         y = value,
         group = variable,
         label = value,
         colour = variable)) +
  theme(panel.background = element_rect(fill="black"),
        plot.title = element_text(colour = "grey65"),
        plot.background = element_rect(fill="black"),
        panel.grid.major = element_line(colour ="grey65"),
        panel.grid.minor = element_blank(),
        axis.ticks = element_line(color="grey65"),
        axis.text = element_text(color="grey65"),
        axis.title = element_text(color="grey65"),
        axis.line = element_line(color="white"),
        axis.text.x = element_text(angle = 75, vjust = .5),
        legend.position="none") +
  scale_y_continuous(breaks = c(seq(0, max(base$value, na.rm = T) + 1000, 500))) +
  coord_cartesian(xlim = c(1.6, 42)) +
  geom_dl(
    aes(label = variable),
    method = list(list(dl.trans(x = x + 0.15), cex = 1.4, "last.points"))) +
  geom_line(size = 1) +
  geom_point(size = 1.3) +
  ggtitle('Alunos Matriculados por Ano') +
  ylab('') +
  xlab('Período')





