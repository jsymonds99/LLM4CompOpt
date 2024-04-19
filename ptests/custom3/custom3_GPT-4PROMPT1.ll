; ModuleID = 'custom3_unoptimized.ll'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Original Matrix:\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Manipulated Matrix:\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %15, %1
  %.01 = phi i32 [ 0, %1 ], [ %17, %15 ]
  %3 = icmp slt i32 %.01, 5
  br i1 %3, label %4, label %18

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %7, %4
  %.0 = phi i32 [ 0, %4 ], [ %14, %7 ]
  %6 = icmp slt i32 %.0, 5
  br i1 %6, label %7, label %15

7:                                                ; preds = %5
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds [5 x i32], ptr %0, i64 %8
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [5 x i32], ptr %9, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %12)
  %14 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

15:                                               ; preds = %5
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %17 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !8

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %50, %1
  %.01 = phi i32 [ 0, %1 ], [ %51, %50 ]
  %3 = icmp slt i32 %.01, 5
  br i1 %3, label %4, label %52

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %48, %4
  %.02 = phi i32 [ 0, %4 ], [ %49, %48 ]
  %6 = icmp slt i32 %.02, 5
  br i1 %6, label %7, label %50

7:                                                ; preds = %5
  br label %8

8:                                                ; preds = %46, %7
  %.03 = phi i32 [ 0, %7 ], [ %47, %46 ]
  %9 = icmp slt i32 %.03, 5
  br i1 %9, label %10, label %48

10:                                               ; preds = %8
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds [5 x i32], ptr %0, i64 %11
  %13 = sext i32 %.02 to i64
  %14 = getelementptr inbounds [5 x i32], ptr %12, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %15, %.03
  store i32 %16, ptr %14, align 4
  br label %17

17:                                               ; preds = %45, %10
  %18 = phi i32 [ %16, %10 ], [ %24, %45 ]
  %.04 = phi i32 [ 0, %10 ], [ %21, %45 ]
  %19 = icmp slt i32 %.04, 5
  br i1 %19, label %20, label %46

20:                                               ; preds = %17
  %21 = add nsw i32 %.04, 1
  %22 = mul nsw i32 %18, %21
  store i32 %22, ptr %14, align 4
  br label %23

23:                                               ; preds = %43, %20
  %24 = phi i32 [ %22, %20 ], [ %31, %43 ]
  %.05 = phi i32 [ 0, %20 ], [ %44, %43 ]
  %25 = icmp slt i32 %.05, 5
  br i1 %25, label %26, label %45

26:                                               ; preds = %23
  %27 = add nsw i32 %.01, %.02
  %28 = mul nsw i32 %.05, %27
  %29 = sub nsw i32 %24, %28
  store i32 %29, ptr %14, align 4
  br label %30

30:                                               ; preds = %40, %26
  %31 = phi i32 [ %29, %26 ], [ %41, %40 ]
  %.0 = phi i32 [ 0, %26 ], [ %42, %40 ]
  %32 = icmp slt i32 %.0, 5
  br i1 %32, label %33, label %43

33:                                               ; preds = %30
  %34 = srem i32 %.0, 2
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %38

36:                                               ; preds = %33
  %37 = add nsw i32 %31, %.0
  store i32 %37, ptr %14, align 4
  br label %40

38:                                               ; preds = %33
  %39 = sub nsw i32 %31, %.0
  store i32 %39, ptr %14, align 4
  br label %40

40:                                               ; preds = %38, %36
  %41 = phi i32 [ %39, %38 ], [ %37, %36 ]
  %42 = add nsw i32 %.0, 1
  br label %30, !llvm.loop !9

43:                                               ; preds = %30
  %44 = add nsw i32 %.05, 1
  br label %23, !llvm.loop !10

45:                                               ; preds = %23
  br label %17, !llvm.loop !11

46:                                               ; preds = %17
  %47 = add nsw i32 %.03, 1
  br label %8, !llvm.loop !12

48:                                               ; preds = %8
  %49 = add nsw i32 %.02, 1
  br label %5, !llvm.loop !13

50:                                               ; preds = %5
  %51 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !14

52:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %15, %0
  %.01 = phi i32 [ 0, %0 ], [ %16, %15 ]
  %3 = icmp slt i32 %.01, 5
  br i1 %3, label %4, label %17

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %7, %4
  %.0 = phi i32 [ 0, %4 ], [ %14, %7 ]
  %6 = icmp slt i32 %.0, 5
  br i1 %6, label %7, label %15

7:                                                ; preds = %5
  %8 = call i32 @rand() #3
  %9 = srem i32 %8, 10
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %10
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [5 x i32], ptr %11, i64 0, i64 %12
  store i32 %9, ptr %13, align 4
  %14 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !15

15:                                               ; preds = %5
  %16 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !16

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @printMatrix(ptr noundef %1)
  call void @manipulateMatrix(ptr noundef %1)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @printMatrix(ptr noundef %1)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
