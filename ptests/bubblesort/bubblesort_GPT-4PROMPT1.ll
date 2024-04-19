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
  %5 = load i64, ptr @seed, align 8
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @bInitarr() #0 {
.lr.ph:
  call void @Initrand()
  store i32 0, ptr @biggest, align 4
  store i32 0, ptr @littlest, align 4
  br label %0

0:                                                ; preds = %.lr.ph, %29
  %.0 = phi i32 [ 1, %.lr.ph ], [ %30, %29 ]
  %1 = call i32 @Rand()
  %2 = sext i32 %1 to i64
  %3 = sdiv i64 %2, 100000
  %4 = mul nsw i64 %3, 100000
  %5 = sub nsw i64 %2, %4
  %6 = sub nsw i64 %5, 50000
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %8
  store i32 %7, ptr %9, align 4
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = load i32, ptr @biggest, align 4
  %14 = icmp sgt i32 %12, %13
  br i1 %14, label %15, label %19

15:                                               ; preds = %0
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %16
  %18 = load i32, ptr %17, align 4
  store i32 %18, ptr @biggest, align 4
  br label %29

19:                                               ; preds = %0
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr @littlest, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %19
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  store i32 %28, ptr @littlest, align 4
  br label %29

29:                                               ; preds = %15, %25, %19
  %30 = add nsw i32 %.0, 1
  %31 = icmp sle i32 %30, 500
  br i1 %31, label %0, label %._crit_edge, !llvm.loop !6

._crit_edge:                                      ; preds = %29
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Bubble(i32 noundef %0) #0 {
.lr.ph2:
  call void @bInitarr()
  store i32 500, ptr @top, align 4
  br label %1

1:                                                ; preds = %.lr.ph2, %._crit_edge
  %2 = load i32, ptr @top, align 4
  %3 = icmp slt i32 1, %2
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1, %25
  %.0 = phi i32 [ %26, %25 ], [ 1, %1 ]
  %4 = sext i32 %.0 to i64
  %5 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %4
  %6 = load i32, ptr %5, align 4
  %7 = add nsw i32 %.0, 1
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = icmp sgt i32 %6, %10
  br i1 %11, label %12, label %25

12:                                               ; preds = %.lr.ph
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %.0, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %20
  store i32 %19, ptr %21, align 4
  %22 = add nsw i32 %.0, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %23
  store i32 %15, ptr %24, align 4
  br label %25

25:                                               ; preds = %12, %.lr.ph
  %26 = add nsw i32 %.0, 1
  %27 = load i32, ptr @top, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %.lr.ph, label %._crit_edge, !llvm.loop !8

._crit_edge:                                      ; preds = %25, %1
  %29 = load i32, ptr @top, align 4
  %30 = sub nsw i32 %29, 1
  store i32 %30, ptr @top, align 4
  %31 = icmp sgt i32 %30, 1
  br i1 %31, label %1, label %._crit_edge3, !llvm.loop !9

._crit_edge3:                                     ; preds = %._crit_edge
  %32 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4
  %33 = load i32, ptr @littlest, align 4
  %34 = icmp ne i32 %32, %33
  br i1 %34, label %39, label %35

35:                                               ; preds = %._crit_edge3
  %36 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 500), align 16
  %37 = load i32, ptr @biggest, align 4
  %38 = icmp ne i32 %36, %37
  br i1 %38, label %39, label %41

39:                                               ; preds = %35, %._crit_edge3
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %41

41:                                               ; preds = %39, %35
  %42 = add nsw i32 %0, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %45)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
.lr.ph:
  br label %0

0:                                                ; preds = %0, %.lr.ph
  %.0 = phi i32 [ 0, %.lr.ph ], [ %1, %0 ]
  call void @Bubble(i32 noundef %.0)
  %1 = add nsw i32 %.0, 1
  %2 = icmp slt i32 %1, 100
  br i1 %2, label %0, label %._crit_edge, !llvm.loop !10

._crit_edge:                                      ; preds = %0
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
