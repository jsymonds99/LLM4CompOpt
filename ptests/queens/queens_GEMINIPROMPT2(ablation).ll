; ModuleID = 'queens_unoptimized.ll'
source_filename = "queens.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [19 x i8] c" Error in Queens.\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local global float 0.000000e+00, align 4
@fixed = dso_local global float 0.000000e+00, align 4
@floated = dso_local global float 0.000000e+00, align 4
@permarray = dso_local global [11 x i32] zeroinitializer, align 16
@pctr = dso_local global i32 0, align 4
@tree = dso_local global ptr null, align 8
@stack = dso_local global [4 x i32] zeroinitializer, align 16
@cellspace = dso_local global [19 x %struct.element] zeroinitializer, align 16
@freelist = dso_local global i32 0, align 4
@movesdone = dso_local global i32 0, align 4
@ima = dso_local global [41 x [41 x i32]] zeroinitializer, align 16
@imb = dso_local global [41 x [41 x i32]] zeroinitializer, align 16
@imr = dso_local global [41 x [41 x i32]] zeroinitializer, align 16
@rma = dso_local global [41 x [41 x float]] zeroinitializer, align 16
@rmb = dso_local global [41 x [41 x float]] zeroinitializer, align 16
@rmr = dso_local global [41 x [41 x float]] zeroinitializer, align 16
@piececount = dso_local global [4 x i32] zeroinitializer, align 16
@class = dso_local global [13 x i32] zeroinitializer, align 16
@piecemax = dso_local global [13 x i32] zeroinitializer, align 16
@puzzl = dso_local global [512 x i32] zeroinitializer, align 16
@p = dso_local global [13 x [512 x i32]] zeroinitializer, align 16
@n = dso_local global i32 0, align 4
@kount = dso_local global i32 0, align 4
@sortlist = dso_local global [5001 x i32] zeroinitializer, align 16
@biggest = dso_local global i32 0, align 4
@littlest = dso_local global i32 0, align 4
@top = dso_local global i32 0, align 4
@z = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@w = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@e = dso_local global [130 x %struct.complex] zeroinitializer, align 16
@zr = dso_local global float 0.000000e+00, align 4
@zi = dso_local global float 0.000000e+00, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @Initrand() #0 {
  store i64 74755, ptr @seed, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Rand() #0 {
  %1 = load i64, ptr @seed, align 8
  %2 = mul nsw i64 %1, 1309
  %3 = add nsw i64 %2, 13849
  %4 = and i64 %3, 65535
  store i64 %4, ptr @seed, align 8
  %5 = load i64, ptr @seed, align 8
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Try(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  store i32 0, ptr %1, align 4
  br label %7

7:                                                ; preds = %63, %6
  %.0 = phi i32 [ 0, %6 ], [ %15, %63 ]
  %8 = load i32, ptr %1, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %7
  %11 = icmp ne i32 %.0, 8
  br label %12

12:                                               ; preds = %10, %7
  %13 = phi i1 [ false, %7 ], [ %11, %10 ]
  br i1 %13, label %14, label %64

14:                                               ; preds = %12
  %15 = add nsw i32 %.0, 1
  store i32 0, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %3, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %63

20:                                               ; preds = %14
  %21 = add nsw i32 %0, %15
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, ptr %2, i64 %22
  %24 = load i32, ptr %23, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %63

26:                                               ; preds = %20
  %27 = sub nsw i32 %0, %15
  %28 = add nsw i32 %27, 7
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %4, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %63

33:                                               ; preds = %26
  %34 = sext i32 %0 to i64
  %35 = getelementptr inbounds i32, ptr %5, i64 %34
  store i32 %15, ptr %35, align 4
  %36 = sext i32 %15 to i64
  %37 = getelementptr inbounds i32, ptr %3, i64 %36
  store i32 0, ptr %37, align 4
  %38 = add nsw i32 %0, %15
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %2, i64 %39
  store i32 0, ptr %40, align 4
  %41 = sub nsw i32 %0, %15
  %42 = add nsw i32 %41, 7
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %4, i64 %43
  store i32 0, ptr %44, align 4
  %45 = icmp slt i32 %0, 8
  br i1 %45, label %46, label %61

46:                                               ; preds = %33
  %47 = add nsw i32 %0, 1
  tail call void @Try(i32 noundef %47, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %48 = load i32, ptr %1, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %60, label %50

50:                                               ; preds = %46
  %51 = sext i32 %15 to i64
  %52 = getelementptr inbounds i32, ptr %3, i64 %51
  store i32 1, ptr %52, align 4
  %53 = add nsw i32 %0, %15
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, ptr %2, i64 %54
  store i32 1, ptr %55, align 4
  %56 = sub nsw i32 %0, %15
  %57 = add nsw i32 %56, 7
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, ptr %4, i64 %58
  store i32 1, ptr %59, align 4
  br label %60

60:                                               ; preds = %50, %46
  br label %62

61:                                               ; preds = %33
  store i32 1, ptr %1, align 4
  br label %62

62:                                               ; preds = %61, %60
  br label %63

63:                                               ; preds = %62, %26, %20, %14
  br label %7, !llvm.loop !6

64:                                               ; preds = %12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Doit() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [9 x i32], align 16
  %3 = alloca [17 x i32], align 16
  %4 = alloca [15 x i32], align 16
  %5 = alloca [9 x i32], align 16
  br label %6

6:                                                ; preds = %26, %0
  %.0 = phi i32 [ -7, %0 ], [ %27, %26 ]
  %7 = icmp sle i32 %.0, 16
  br i1 %7, label %8, label %28

8:                                                ; preds = %6
  %9 = icmp sge i32 %.0, 1
  br i1 %9, label %10, label %15

10:                                               ; preds = %8
  %11 = icmp sle i32 %.0, 8
  br i1 %11, label %12, label %15

12:                                               ; preds = %10
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %13
  store i32 1, ptr %14, align 4
  br label %15

15:                                               ; preds = %12, %10, %8
  %16 = icmp sge i32 %.0, 2
  br i1 %16, label %17, label %20

17:                                               ; preds = %15
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %18
  store i32 1, ptr %19, align 4
  br label %20

20:                                               ; preds = %17, %15
  %21 = icmp sle i32 %.0, 7
  br i1 %21, label %22, label %26

22:                                               ; preds = %20
  %23 = add nsw i32 %.0, 7
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %24
  store i32 1, ptr %25, align 4
  br label %26

26:                                               ; preds = %22, %20
  %27 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !8

28:                                               ; preds = %6
  %29 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 0
  %30 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 0
  %31 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 0
  %32 = getelementptr inbounds [9 x i32], ptr %5, i64 0, i64 0
  call void @Try(i32 noundef 1, ptr noundef %1, ptr noundef %29, ptr noundef %30, ptr noundef %31, ptr noundef %32)
  %33 = load i32, ptr %1, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %37, label %35

35:                                               ; preds = %28
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %37

37:                                               ; preds = %35, %28
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %5, %1
  %.0 = phi i32 [ 1, %1 ], [ %6, %5 ]
  %3 = icmp sle i32 %.0, 50
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  tail call void @Doit()
  br label %5

5:                                                ; preds = %4
  %6 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

7:                                                ; preds = %2
  %8 = add nsw i32 %0, 1
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %8)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %4, %0
  %.0 = phi i32 [ 0, %0 ], [ %5, %4 ]
  %2 = icmp slt i32 %.0, 100
  br i1 %2, label %3, label %6

3:                                                ; preds = %1
  tail call void @Queens(i32 noundef %.0)
  br label %4

4:                                                ; preds = %3
  %5 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !10

6:                                                ; preds = %1
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
