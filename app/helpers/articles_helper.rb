module ArticlesHelper
  def Dia_mes_ano(datetime)
    datetime.strftime('%B %e,%Y')
  end
end
