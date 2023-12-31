% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xnaStringSetClass.R
\name{set2List}
\alias{set2List}
\alias{set2List,XNAStringSet-method}
\title{Define method to save XNAStringSet object as a list of XNAString objects}
\usage{
set2List(obj)

\S4method{set2List}{XNAStringSet}(obj)
}
\arguments{
\item{obj}{XNAStringSet object}
}
\value{
list of XNAString objects
}
\description{
Define method to save XNAStringSet object as a list of XNAString objects
}
\examples{
my_dic <- data.table::data.table(type = c(rep('base',3),
                                          rep('sugar',2),
                                          rep('backbone',3)),
                                symbol = c('G', 'E', 'A', 'F',
                                           'O', 'S', 'B', 'X'))
obj2 <- XNAString(name = 'b',
                  base = 'GGE',
                  sugar = 'FFO',
                  dictionary = my_dic)
obj3 <- XNAString(name = 'b',
                  base = c('GGE','EEE'),
                  sugar = c('FFO', 'OOO'),
                  dictionary = my_dic)
XNAStringSetObj <- XNAStringSet(objects=list(obj2, obj3))
set2List(XNAStringSetObj)
}
