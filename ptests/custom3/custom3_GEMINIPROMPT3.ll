; ModuleID = 'custom3_unoptimized.ll'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Original Matrix:\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Manipulated Matrix:\0A\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Original Matrix:\00", align 1
@str.1 = private unnamed_addr constant [20 x i8] c"Manipulated Matrix:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %8, %1
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %8 ], [ 0, %1 ]
  %exitcond7 = icmp ne i64 %indvars.iv4, 5
  br i1 %exitcond7, label %3, label %9

3:                                                ; preds = %2, %4
  %indvars.iv = phi i64 [ %indvars.iv.next, %4 ], [ 0, %2 ]
  %exitcond = icmp ne i64 %indvars.iv, 5
  br i1 %exitcond, label %4, label %8

4:                                                ; preds = %3
  %5 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv4, i64 %indvars.iv
  %6 = load i32, ptr %5, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %6) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %3, !llvm.loop !6

8:                                                ; preds = %3
  %putchar2 = call i32 @putchar(i32 10)
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  br label %2, !llvm.loop !8

9:                                                ; preds = %2
  %putchar = call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %44, %1
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %44 ], [ 0, %1 ]
  %exitcond14 = icmp ne i64 %indvars.iv11, 5
  br i1 %exitcond14, label %3, label %45

3:                                                ; preds = %2, %43
  %indvars.iv = phi i64 [ %indvars.iv.next, %43 ], [ 0, %2 ]
  %exitcond10 = icmp ne i64 %indvars.iv, 5
  br i1 %exitcond10, label %4, label %44

4:                                                ; preds = %3, %41
  %.03 = phi i32 [ %42, %41 ], [ 0, %3 ]
  %exitcond8 = icmp ne i32 %.03, 5
  br i1 %exitcond8, label %5, label %43

5:                                                ; preds = %4
  %6 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv11, i64 %indvars.iv
  %7 = load i32, ptr %6, align 4
  %8 = add nsw i32 %7, %.03
  store i32 %8, ptr %6, align 4
  br label %9

9:                                                ; preds = %39, %5
  %.04 = phi i32 [ 0, %5 ], [ %40, %39 ]
  %exitcond7 = icmp ne i32 %.04, 5
  br i1 %exitcond7, label %10, label %41

10:                                               ; preds = %9
  %11 = add nuw nsw i32 %.04, 1
  %12 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv11, i64 %indvars.iv
  %13 = load i32, ptr %12, align 4
  %14 = mul nsw i32 %13, %11
  store i32 %14, ptr %12, align 4
  br label %15

15:                                               ; preds = %37, %10
  %.05 = phi i32 [ 0, %10 ], [ %38, %37 ]
  %exitcond6 = icmp ne i32 %.05, 5
  br i1 %exitcond6, label %16, label %39

16:                                               ; preds = %15
  %17 = add nuw nsw i64 %indvars.iv11, %indvars.iv
  %18 = trunc i64 %17 to i32
  %19 = mul nuw nsw i32 %.05, %18
  %20 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv11, i64 %indvars.iv
  %21 = load i32, ptr %20, align 4
  %22 = sub nsw i32 %21, %19
  store i32 %22, ptr %20, align 4
  br label %23

23:                                               ; preds = %35, %16
  %.0 = phi i32 [ 0, %16 ], [ %36, %35 ]
  %exitcond = icmp ne i32 %.0, 5
  br i1 %exitcond, label %24, label %37

24:                                               ; preds = %23
  %25 = and i32 %.0, 1
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %31

27:                                               ; preds = %24
  %28 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv11, i64 %indvars.iv
  %29 = load i32, ptr %28, align 4
  %30 = add nsw i32 %29, %.0
  store i32 %30, ptr %28, align 4
  br label %35

31:                                               ; preds = %24
  %32 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv11, i64 %indvars.iv
  %33 = load i32, ptr %32, align 4
  %34 = sub nsw i32 %33, %.0
  store i32 %34, ptr %32, align 4
  br label %35

35:                                               ; preds = %27, %31
  %36 = add nuw nsw i32 %.0, 1
  br label %23, !llvm.loop !9

37:                                               ; preds = %23
  %38 = add nuw nsw i32 %.05, 1
  br label %15, !llvm.loop !10

39:                                               ; preds = %15
  %40 = add nuw nsw i32 %.04, 1
  br label %9, !llvm.loop !11

41:                                               ; preds = %9
  %42 = add nuw nsw i32 %.03, 1
  br label %4, !llvm.loop !12

43:                                               ; preds = %4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %3, !llvm.loop !13

44:                                               ; preds = %3
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br label %2, !llvm.loop !14

45:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %8, %0
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %8 ], [ 0, %0 ]
  %exitcond7 = icmp ne i64 %indvars.iv4, 5
  br i1 %exitcond7, label %3, label %9

3:                                                ; preds = %2, %4
  %indvars.iv = phi i64 [ %indvars.iv.next, %4 ], [ 0, %2 ]
  %exitcond = icmp ne i64 %indvars.iv, 5
  br i1 %exitcond, label %4, label %8

4:                                                ; preds = %3
  %5 = call i32 @rand() #4
  %6 = srem i32 %5, 10
  %7 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv4, i64 %indvars.iv
  store i32 %6, ptr %7, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %3, !llvm.loop !15

8:                                                ; preds = %3
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  br label %2, !llvm.loop !16

9:                                                ; preds = %2
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1)
  call void @manipulateMatrix(ptr noundef nonnull %1)
  %puts2 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @printMatrix(ptr noundef nonnull %1)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
