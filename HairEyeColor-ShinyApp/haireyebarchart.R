haireyebarchart<-function(){
library(reshape2)
mm = melt(HairEyeColor)
mm <- within(mm, {
  color <- tolower(Hair)
  color <- ifelse(color == 'blond', 'yellow', color)
  color1 <- tolower(Eye)
  color1 <- ifelse(color1 == 'hazel', 'gold', color1)
  value <- value / 2
  value1 <- value
})

mm <- melt(mm, id.vars = -(4:5))
cols <- c(apply(mm[1:16, c('color1','color')], 1, c))

library(ggplot2)
ggplot(data = mm, aes(x = interaction(Hair, Eye), y = value, fill = interaction(variable, interaction(Hair, Eye)))) +
  geom_bar(stat = 'identity') + facet_grid(Sex ~ .) + 
  theme(legend.position = 'none') + scale_fill_manual(values = cols)+
  ggtitle("Sample Distribution for Hair-Eye Color Mix")+
  labs(x="Hair-Eye Mix",y="Number of Sample Population")
}

