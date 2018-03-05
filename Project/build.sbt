name := """first_example"""

version := "1.0.0"

lazy val root = (project in file("."))
  .settings(
    name := "Task1",
    scalaVersion := "2.12.4"
  )

libraryDependencies += "com.typesafe.play" %% "anorm" % "2.5.3"

libraryDependencies += "org.scalatestplus.play" %% "scalatestplus-play" % "3.1.2" % Test

libraryDependencies += "com.typesafe.slick" %% "slick" % "3.2.1"
