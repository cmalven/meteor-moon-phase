root = exports ? this

root.moonphase = (date) ->
  date.setTime( date.getTime() + date.getTimezoneOffset() * 60000 )
  bluemoon = new Date( 96, 1, 3, 16, 15, 0 )
  lunarperiod = 29 * ( 24 * 3600 * 1000 ) + 12 * ( 3600 * 1000 ) + 44.05 * ( 60 * 1000 )
  phasetime = ( date.getTime() - bluemoon.getTime() ) % lunarperiod
  fullmoon = Math.round( ( lunarperiod - phasetime ) / ( 24 * 3600 * 1000 ) )
  fraction = phasetime / lunarperiod
  percent = Math.round( 200 * fraction ) % 100
  percentAsDecimal = percent / 100
  numSteps = 40
  step = Math.round(percentAsDecimal * numSteps)
  return ("0" + step).slice(-2)
