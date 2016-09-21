
# 根據交易年月以及區域計算每平方公尺平均成交價
rxCube(
  formula = price_per_sqmeter ~ area :trading_ym, 
  data=lvr_data, 
  outFile = 'lvr_cube2.xdf', 
  overwrite = TRUE,
  mean = TRUE,
  transforms=list(trading_ym = as.factor(trading_ym))
)

# 讀取 R 的資料
lvr_cube2 <- file.path('lvr_cube2.xdf')

# 將資料繪製成折線圖
rxLinePlot(formula = price_per_sqmeter ~ trading_ym | area, 
           data= lvr_cube2, 
           rowSelection = (
            trading_ym >= '2012-01-01'),
           transforms=list(trading_ym = as.Date(trading_ym))
)
