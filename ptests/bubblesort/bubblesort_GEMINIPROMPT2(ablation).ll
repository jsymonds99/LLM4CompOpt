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

1:                                                ; preds = %0, %17
  %indvars.iv2 = phi i64 [ 1, %0 ], [ %indvars.iv.next, %17 ]
  %2 = call i32 @Rand()
  %3 = sext i32 %2 to i64
  %4 = sdiv i64 %3, 100000
  %5 = mul nsw i64 %4, 100000
  %6 = sub nsw i64 %3, %5
  %7 = sub nsw i64 %6, 50000
  %8 = trunc i64 %7 to i32
  %9 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv2
  store i32 %8, ptr %9, align 4
  %10 = load i32, ptr @biggest, align 4
  %11 = icmp sgt i32 %8, %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %1
  store i32 %8, ptr @biggest, align 4
  br label %17

13:                                               ; preds = %1
  %14 = load i32, ptr @littlest, align 4
  %15 = icmp slt i32 %8, %14
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i32 %8, ptr @littlest, align 4
  br label %17

17:                                               ; preds = %12, %16, %13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 501
  br i1 %exitcond, label %1, label %18, !llvm.loop !6

18:                                               ; preds = %17
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Bubble(i32 noundef %0) #0 {
  call void @bInitarr()
  store i32 500, ptr @top, align 4
  br i1 true, label %.preheader.lr.ph, label %._crit_edge4

._crit_edge4:                                     ; preds = %1
  br label %19

.preheader.lr.ph:                                 ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %16
  %2 = phi i32 [ 500, %.preheader.lr.ph ], [ %17, %16 ]
  %3 = sext i32 %2 to i64
  %4 = icmp slt i64 1, %3
  br i1 %4, label %.lr.ph, label %16

.lr.ph:                                           ; preds = %.preheader
  %.pre = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4
  br label %5

5:                                                ; preds = %.lr.ph, %13
  %6 = phi i32 [ %.pre, %.lr.ph ], [ %14, %13 ]
  %indvars.iv2 = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %13 ]
  %7 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %8 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv.next
  %9 = load i32, ptr %8, align 4
  %10 = icmp sgt i32 %6, %9
  br i1 %10, label %11, label %13

11:                                               ; preds = %5
  %12 = load i32, ptr %7, align 4
  store i32 %9, ptr %7, align 4
  store i32 %12, ptr %8, align 4
  br label %13

13:                                               ; preds = %11, %5
  %14 = phi i32 [ %12, %11 ], [ %9, %5 ]
  %15 = icmp slt i64 %indvars.iv.next, %3
  br i1 %15, label %5, label %._crit_edge, !llvm.loop !8

._crit_edge:                                      ; preds = %13
  br label %16

16:                                               ; preds = %._crit_edge, %.preheader
  %17 = sub nsw i32 %2, 1
  store i32 %17, ptr @top, align 4
  %18 = icmp sgt i32 %17, 1
  br i1 %18, label %.preheader, label %._crit_edge3, !llvm.loop !9

._crit_edge3:                                     ; preds = %16
  br label %19

19:                                               ; preds = %._crit_edge4, %._crit_edge3
  %20 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4
  %21 = load i32, ptr @littlest, align 4
  %22 = icmp ne i32 %20, %21
  br i1 %22, label %27, label %23

23:                                               ; preds = %19
  %24 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 500), align 16
  %25 = load i32, ptr @biggest, align 4
  %26 = icmp ne i32 %24, %25
  br i1 %26, label %27, label %29

27:                                               ; preds = %23, %19
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %29

29:                                               ; preds = %27, %23
  %30 = add nsw i32 %0, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %33)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %0, %1
  %.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  call void @Bubble(i32 noundef %.01)
  %2 = add nuw nsw i32 %.01, 1
  %exitcond = icmp ne i32 %2, 100
  br i1 %exitcond, label %1, label %3, !llvm.loop !10

3:                                                ; preds = %1
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
