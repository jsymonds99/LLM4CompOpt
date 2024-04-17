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

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @Initrand() #0 {
  store i64 74755, ptr @seed, align 8
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @Rand() #1 {
  %1 = load i64, ptr @seed, align 8
  %2 = mul nsw i64 %1, 1309
  %3 = add nsw i64 %2, 13849
  %4 = and i64 %3, 65535
  store i64 %4, ptr @seed, align 8
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @bInitarr() #2 {
.lr.ph:
  call void @Initrand()
  store i32 0, ptr @biggest, align 4
  store i32 0, ptr @littlest, align 4
  br label %0

0:                                                ; preds = %.lr.ph, %18
  %.0 = phi i32 [ 1, %.lr.ph ], [ %19, %18 ]
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
  %10 = load i32, ptr @biggest, align 4
  %11 = icmp sgt i32 %7, %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %0
  store i32 %7, ptr @biggest, align 4
  br label %18

13:                                               ; preds = %0
  %14 = load i32, ptr @littlest, align 4
  %15 = icmp slt i32 %7, %14
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i32 %7, ptr @littlest, align 4
  br label %17

17:                                               ; preds = %16, %13
  br label %18

18:                                               ; preds = %17, %12
  %19 = add nsw i32 %.0, 1
  %20 = icmp sle i32 %19, 500
  br i1 %20, label %0, label %._crit_edge, !llvm.loop !6

._crit_edge:                                      ; preds = %18
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Bubble(i32 noundef %0) #3 {
  call void @bInitarr()
  store i32 500, ptr @top, align 4
  br i1 true, label %.lr.ph2, label %._crit_edge15

._crit_edge15:                                    ; preds = %1
  br label %21

.lr.ph2:                                          ; preds = %1
  br label %2

2:                                                ; preds = %.lr.ph2, %18
  %3 = phi i32 [ 500, %.lr.ph2 ], [ %19, %18 ]
  %4 = icmp slt i32 1, %3
  br i1 %4, label %.lr.ph, label %18

.lr.ph:                                           ; preds = %2
  %.pre = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4
  br label %5

5:                                                ; preds = %.lr.ph, %15
  %6 = phi i32 [ %.pre, %.lr.ph ], [ %16, %15 ]
  %.0 = phi i32 [ 1, %.lr.ph ], [ %9, %15 ]
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %7
  %9 = add nsw i32 %.0, 1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = icmp sgt i32 %6, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %5
  store i32 %12, ptr %8, align 4
  store i32 %6, ptr %11, align 4
  br label %15

15:                                               ; preds = %14, %5
  %16 = phi i32 [ %6, %14 ], [ %12, %5 ]
  %17 = icmp slt i32 %9, %3
  br i1 %17, label %5, label %._crit_edge, !llvm.loop !8

._crit_edge:                                      ; preds = %15
  br label %18

18:                                               ; preds = %._crit_edge, %2
  %19 = sub nsw i32 %3, 1
  store i32 %19, ptr @top, align 4
  %20 = icmp sgt i32 %19, 1
  br i1 %20, label %2, label %._crit_edge3, !llvm.loop !9

._crit_edge3:                                     ; preds = %18
  br label %21

21:                                               ; preds = %._crit_edge15, %._crit_edge3
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

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #3 {
.lr.ph:
  br label %0

0:                                                ; preds = %.lr.ph, %0
  %.0 = phi i32 [ 0, %.lr.ph ], [ %1, %0 ]
  call void @Bubble(i32 noundef %.0)
  %1 = add nsw i32 %.0, 1
  %2 = icmp slt i32 %1, 100
  br i1 %2, label %0, label %._crit_edge, !llvm.loop !10

._crit_edge:                                      ; preds = %0
  ret i32 0
}

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
