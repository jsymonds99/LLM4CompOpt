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

2:                                                ; preds = %1, %7
  %indvars.iv5 = phi i64 [ 0, %1 ], [ %indvars.iv.next6, %7 ]
  br label %3

3:                                                ; preds = %2, %3
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %3 ]
  %4 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv5, i64 %indvars.iv
  %5 = load i32, ptr %4, align 4
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %5) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond.not, label %7, label %3, !llvm.loop !6

7:                                                ; preds = %3
  %putchar = tail call i32 @putchar(i32 10)
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8.not = icmp eq i64 %indvars.iv.next6, 5
  br i1 %exitcond8.not, label %8, label %2, !llvm.loop !8

8:                                                ; preds = %7
  %putchar9 = tail call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %1, %33
  %indvars.iv17 = phi i64 [ 0, %1 ], [ %indvars.iv.next18, %33 ]
  br label %3

3:                                                ; preds = %2, %32
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %32 ]
  %.phi.trans.insert21 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv17, i64 %indvars.iv
  %.pre = load i32, ptr %.phi.trans.insert21, align 4
  br label %4

4:                                                ; preds = %3, %30
  %5 = phi i32 [ %.pre, %3 ], [ %25, %30 ]
  %.039 = phi i32 [ 0, %3 ], [ %31, %30 ]
  %6 = add nsw i32 %5, %.039
  store i32 %6, ptr %.phi.trans.insert21, align 4
  br label %7

7:                                                ; preds = %4, %29
  %8 = phi i32 [ %6, %4 ], [ %25, %29 ]
  %.048 = phi i32 [ 0, %4 ], [ %9, %29 ]
  %9 = add nuw nsw i32 %.048, 1
  %10 = mul nsw i32 %8, %9
  store i32 %10, ptr %.phi.trans.insert21, align 4
  br label %11

11:                                               ; preds = %7, %27
  %12 = phi i32 [ %10, %7 ], [ %25, %27 ]
  %.057 = phi i32 [ 0, %7 ], [ %28, %27 ]
  %13 = add nuw nsw i64 %indvars.iv17, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = mul nuw nsw i32 %.057, %14
  %16 = sub nsw i32 %12, %15
  store i32 %16, ptr %.phi.trans.insert21, align 4
  br label %17

17:                                               ; preds = %11, %24
  %18 = phi i32 [ %16, %11 ], [ %25, %24 ]
  %.06 = phi i32 [ 0, %11 ], [ %26, %24 ]
  %.urem = and i32 %.06, 1
  %19 = icmp eq i32 %.urem, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %17
  %21 = add nsw i32 %18, %.06
  br label %24

22:                                               ; preds = %17
  %23 = sub nsw i32 %18, %.06
  br label %24

24:                                               ; preds = %22, %20
  %25 = phi i32 [ %23, %22 ], [ %21, %20 ]
  store i32 %25, ptr %.phi.trans.insert21, align 4
  %26 = add nuw nsw i32 %.06, 1
  %exitcond.not = icmp eq i32 %26, 5
  br i1 %exitcond.not, label %27, label %17, !llvm.loop !9

27:                                               ; preds = %24
  %28 = add nuw nsw i32 %.057, 1
  %exitcond12.not = icmp eq i32 %28, 5
  br i1 %exitcond12.not, label %29, label %11, !llvm.loop !10

29:                                               ; preds = %27
  %exitcond13.not = icmp eq i32 %9, 5
  br i1 %exitcond13.not, label %30, label %7, !llvm.loop !11

30:                                               ; preds = %29
  %31 = add nuw nsw i32 %.039, 1
  %exitcond14.not = icmp eq i32 %31, 5
  br i1 %exitcond14.not, label %32, label %4, !llvm.loop !12

32:                                               ; preds = %30
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond16.not = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond16.not, label %33, label %3, !llvm.loop !13

33:                                               ; preds = %32
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20.not = icmp eq i64 %indvars.iv.next18, 5
  br i1 %exitcond20.not, label %34, label %2, !llvm.loop !14

34:                                               ; preds = %33
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %0, %7
  %indvars.iv5 = phi i64 [ 0, %0 ], [ %indvars.iv.next6, %7 ]
  br label %3

3:                                                ; preds = %2, %3
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %3 ]
  %4 = tail call i32 @rand() #4
  %5 = srem i32 %4, 10
  %6 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv5, i64 %indvars.iv
  store i32 %5, ptr %6, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond.not, label %7, label %3, !llvm.loop !15

7:                                                ; preds = %3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8.not = icmp eq i64 %indvars.iv.next6, 5
  br i1 %exitcond8.not, label %8, label %2, !llvm.loop !16

8:                                                ; preds = %7
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1)
  call void @manipulateMatrix(ptr noundef nonnull %1)
  %puts9 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
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
