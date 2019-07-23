# 1.查询同时存在1课程和2课程的情况
select * from
      (select * from  student_course where student_course.courseid='1') as t1,
	  (select * from  student_course where student_course.courseid='2') as t2 
where t1.studentid = t2.studentid;

# 2.查询同时存在1课程和2课程的情况
select * from 
      (select * from  student_course where student_course.courseid='1') as t1,
	  (select * from  student_course where student_course.courseid='2') as t2 
where t1.studentid = t2.studentid;

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select student.id,student.name,AVG(score)
from student_course,student
where student_course.studentid=student.id
group by student.id
having AVG(score)>=60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select student.*,score
from student_course,student
where
and score is null;

# 5.查询所有有成绩的SQL
select distinct student.*,score
from student_course,student
where student_course.studentid=student.id;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select student.*
from student,student_course a,student_course b
where a.studentid=student.id
and b.studentid=student.id
and a.courseid='1'
and b.courseid='2';

# 7.检索1课程分数小于60，按分数降序排列的学生信息
select student.*,score
from student,student_course
where student_course.studentid=student.id
and student_course.courseid='1'
and score<60;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select student_course.courseid,AVG(score)
from student_course
group by student_course.courseid
order by AVG(score) desc,student_course.courseid;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select student.name,student_course.score
from student,student_course,course
where student_course.studentid=student.id
and student_course.courseid=course.id
and course.name='数学'
and student_course.score<60;