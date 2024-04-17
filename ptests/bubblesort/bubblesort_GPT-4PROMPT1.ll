; ModuleID = 'bubblesort_unoptimized.ll'
source_filename = "bubblesort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local global i64 0, align 8
@biggest = dso_local global i32 0, align 4
@littlest = dso_local global i32 0, align 4
@sortlist = dso_local global [5001 x i32] zeroinitializer, align 16
@top = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"Error3 in Bubble.\0A\00", align 1
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
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @bInitarr() #0 {
  call void @Initrand()
  store i32 0, ptr @biggest, align 4
  store i32 0, ptr @littlest, align 4
  br label %1

1:                                                ; preds = %21, %0
  %.0 = phi i32 [ 1, %0 ], [ %22, %21 ]
  %2 = icmp sle i32 %.0, 500
  br i1 %2, label %3, label %23

3:                                                ; preds = %1
  %4 = call i32 @Rand()
  %5 = sext i32 %4 to i64
  %6 = sdiv i64 %5, 100000
  %7 = mul nsw i64 %6, 100000
  %8 = sub nsw i64 %5, %7
  %9 = sub nsw i64 %8, 50000
  %10 = trunc i64 %9 to i32
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %11
  store i32 %10, ptr %12, align 4
  %13 = load i32, ptr @biggest, align 4
  %14 = icmp sgt i32 %10, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  store i32 %10, ptr @biggest, align 4
  br label %21

16:                                               ; preds = %3
  %17 = load i32, ptr @littlest, align 4
  %18 = icmp slt i32 %10, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  store i32 %10, ptr @littlest, align 4
  br label %20

20:                                               ; preds = %19, %16
  br label %21

21:                                               ; preds = %20, %15
  %22 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !6

23:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Bubble(i32 noundef %0) #0 {
  call void @bInitarr()
  store i32 500, ptr @top, align 4
  br label %2

2:                                                ; preds = %19, %1
  %3 = phi i32 [ %20, %19 ], [ 500, %1 ]
  %4 = icmp sgt i32 %3, 1
  br i1 %4, label %5, label %21

5:                                                ; preds = %2
  br label %6

6:                                                ; preds = %18, %5
  %.0 = phi i32 [ 1, %5 ], [ %12, %18 ]
  %7 = icmp slt i32 %.0, %3
  br i1 %7, label %8, label %19

8:                                                ; preds = %6
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %.0, 1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = icmp sgt i32 %11, %15
  br i1 %16, label %17, label %18

17:                                               ; preds = %8
  store i32 %15, ptr %10, align 4
  store i32 %11, ptr %14, align 4
  br label %18

18:                                               ; preds = %17, %8
  br label %6, !llvm.loop !8

19:                                               ; preds = %6
  %20 = sub nsw i32 %3, 1
  store i32 %20, ptr @top, align 4
  br label %2, !llvm.loop !9

21:                                               ; preds = %2
  %22 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4
  %23 = load i32, ptr @littlest, align 4
  %24 = icmp ne i32 %22, %23
  br i1 %24, label %29, label %25

25:                                               ; preds = %21
  %26 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 500), align 16
  %27 = load i32, ptr @biggest, align 4
  %28 = icmp ne i32 %26, %27
  br i1 %28, label %29, label %31

29:                                               ; preds = %25, %21
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %31

31:                                               ; preds = %29, %25
  %32 = add nsw i32 %0, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %35)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %3, %0
  %.0 = phi i32 [ 0, %0 ], [ %4, %3 ]
  %2 = icmp slt i32 %.0, 100
  br i1 %2, label %3, label %5

3:                                                ; preds = %1
  call void @Bubble(i32 noundef %.0)
  %4 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !10

5:                                                ; preds = %1
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
