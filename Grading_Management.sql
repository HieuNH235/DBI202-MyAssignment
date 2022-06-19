
Create table Students(
	StudentID nchar(8) not null PRIMARY KEY,
	StudentName nvarchar(50) not null
)

Create table Subjects(
	SubjectID nchar(6) not null PRIMARY KEY,
	SubjectName nvarchar(50) not null
)

Create table Assessments(
	SubjectID nchar(6) not null FOREIGN KEY REFERENCES [Subjects](SubjectID),
	Category nvarchar(50) not null PRIMARY KEY,
	[Type] nvarchar(50) not null CHECK ([type] in ('quiz','on-going','pratical exam','final exam')),
	Part int not null,
	[Weight] float not null,
	CompletionCriteria int not null,
	Duration nvarchar(50) not null
)

Create Table Grades(
	StudentID	nchar(8) not null FOREIGN KEY REFERENCES [Students](StudentID),
	Category nvarchar(50) not null FOREIGN KEY REFERENCES [Assessments](Category),
	Item nvarchar(50) not null PRIMARY KEY,
	[Weight] int not null,
	Value float not null,
	Comment nvarchar(50)	
)

Create table Groups(
	SubjectID nchar(6) not null FOREIGN KEY REFERENCES [Subjects](SubjectID),
	GroupID nvarchar(20) not null PRIMARY KEY,
	[Start] date not null,
	[End] date not null,
	Semester nvarchar(20) not null
)

Create table Group_Student(
	GroupID nvarchar(20) not null FOREIGN KEY REFERENCES [Groups](GroupID),
	StudentID nchar(8) not null FOREIGN KEY REFERENCES [Students](StudentID),
	CONSTRAINT pk_Group_Student PRIMARY KEY ([GroupID],[StudentID])
)