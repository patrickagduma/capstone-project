set sql_safe_updates = 0;

delete from student_class_enrollment;
delete from student_classes;
delete from topic_item_answer;
delete from topic_item;
delete from topic;
delete from classes;
delete from subject_videos;
delete from subject;
delete from users where user_type <> 'A';
commit;

set sql_safe_updates = 1;