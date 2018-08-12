# CHANGELOG

## 0.1.13

* skip processing if no processor classes defined

## 0.1.12

* Improve `Multiply` processor to match fractions
* Improve `SingleQuotes` and `DoubleQuotes` processor to respect locale

## 0.1.11

* Fix `Nbsp` bug

## 0.1.9

* Improve `Nbsp` processor (avoid matching newlines etc.)

## 0.1.8

* Add `Nbsp` processor to default processors

## 0.1.7

* Ellipsis: `. . .`

## 0.1.6

* @asgerb: Right now the DoubleQuotes processor only fixes the cases where both beginning and end quote is a straight double quote (") and not the cases where curly quotes are used wrongly
* @asgerb: Similarly to the DoubleQuotes processor, the SingleQuotes processor currently fixes only the cases where both beginning and end quote is a straight single quote (') and not the cases where curly quotes are used wrongly

## 0.1.5

* Nbsp: `Title. © 2016`
* Nbsp: `No. 3`, `Vol. 2`
