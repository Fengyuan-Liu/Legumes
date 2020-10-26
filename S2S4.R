# elimiate the negative values
S2S4 <- X23102020 %>% mutate(folate = if_else(folate < 0, 0, folate))

#get the mean and std
mean_s2s4 <- aggregate(S2S4$`folate content`, list(S2S4$sample, S2S4$main_ingredient, S2S4$component),
                       mean) 
std_s2s4 <- aggregate(S2S4$`folate content`, list(S2S4$sample, S2S4$main_ingredient, S2S4$component),
                      sd) 

S2S4 %>% filter (main_ingredient == "S4") %>% ggbarplot(x = "component", y = "folate",
fill = "sample", color = "white", palette = "jco", add.params = list(color = "black"), 
add = "mean_sd", title = "S4", position = position_dodge(0.8), xlab = "", 
ylab = "Folate (µg/100g FW)", x.text.angle = 30) + theme(plot.title = element_text(hjust = 0.5),
axis.text = element_text(size = 10), legend.position = c(0, 1), legend.title = element_blank(),
legend.text = element_text(size = 10),axis.title.y = element_text(size = 11))