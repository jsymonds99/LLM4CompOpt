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
@str = private unnamed_addr constant [18 x i8] c"Error3 in Bubble.\00", align 1

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

1:                                                ; preds = %19, %0
  %lsr.iv = phi i64 [ %lsr.iv.next, %19 ], [ -2000, %0 ]
  %exitcond = icmp ne i64 %lsr.iv, 0
  br i1 %exitcond, label %2, label %20

2:                                                ; preds = %1
  %3 = call i32 @Rand(), !range !6
  %.fr1 = freeze i32 %3
  %4 = sext i32 %.fr1 to i64
  %5 = srem i64 %4, 100000
  %6 = trunc i64 %5 to i32
  %7 = add nsw i32 %6, -50000
  %scevgep = getelementptr i8, ptr @sortlist, i64 %lsr.iv
  %scevgep3 = getelementptr i8, ptr %scevgep, i64 2004
  store i32 %7, ptr %scevgep3, align 4
  %8 = load i32, ptr %scevgep3, align 4
  %9 = load i32, ptr @biggest, align 4
  %10 = icmp sgt i32 %8, %9
  br i1 %10, label %11, label %13

11:                                               ; preds = %2
  %scevgep4 = getelementptr i8, ptr @sortlist, i64 %lsr.iv
  %scevgep5 = getelementptr i8, ptr %scevgep4, i64 2004
  %12 = load i32, ptr %scevgep5, align 4
  store i32 %12, ptr @biggest, align 4
  br label %19

13:                                               ; preds = %2
  %scevgep6 = getelementptr i8, ptr @sortlist, i64 %lsr.iv
  %scevgep7 = getelementptr i8, ptr %scevgep6, i64 2004
  %14 = load i32, ptr %scevgep7, align 4
  %15 = load i32, ptr @littlest, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %19

17:                                               ; preds = %13
  %scevgep8 = getelementptr i8, ptr @sortlist, i64 %lsr.iv
  %scevgep9 = getelementptr i8, ptr %scevgep8, i64 2004
  %18 = load i32, ptr %scevgep9, align 4
  store i32 %18, ptr @littlest, align 4
  br label %19

19:                                               ; preds = %11, %17, %13
  %lsr.iv.next = add nsw i64 %lsr.iv, 4
  br label %1, !llvm.loop !7

20:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Bubble(i32 noundef %0) #0 {
  call void @bInitarr()
  br label %2

2:                                                ; preds = %22, %1
  %storemerge = phi i32 [ 500, %1 ], [ %24, %22 ]
  store i32 %storemerge, ptr @top, align 4
  %3 = icmp sgt i32 %storemerge, 1
  br i1 %3, label %.preheader, label %25

.preheader:                                       ; preds = %2
  br label %4

4:                                                ; preds = %.preheader, %21
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %21 ]
  %5 = load i32, ptr @top, align 4
  %6 = sext i32 %5 to i64
  %7 = icmp slt i64 %indvars.iv, %6
  br i1 %7, label %8, label %22

8:                                                ; preds = %4
  %9 = shl nuw nsw i64 %indvars.iv, 2
  %scevgep = getelementptr i8, ptr @sortlist, i64 %9
  %10 = load i32, ptr %scevgep, align 4
  %11 = shl nuw nsw i64 %indvars.iv, 2
  %scevgep10 = getelementptr i8, ptr @sortlist, i64 %11
  %scevgep11 = getelementptr i8, ptr %scevgep10, i64 4
  %12 = load i32, ptr %scevgep11, align 4
  %13 = icmp sgt i32 %10, %12
  br i1 %13, label %14, label %21

14:                                               ; preds = %8
  %15 = shl nuw nsw i64 %indvars.iv, 2
  %scevgep4 = getelementptr i8, ptr @sortlist, i64 %15
  %16 = load i32, ptr %scevgep4, align 4
  %17 = shl nuw nsw i64 %indvars.iv, 2
  %scevgep5 = getelementptr i8, ptr @sortlist, i64 %17
  %scevgep6 = getelementptr i8, ptr %scevgep5, i64 4
  %18 = load i32, ptr %scevgep6, align 4
  %19 = shl nuw nsw i64 %indvars.iv, 2
  %scevgep7 = getelementptr i8, ptr @sortlist, i64 %19
  store i32 %18, ptr %scevgep7, align 4
  %20 = shl nuw nsw i64 %indvars.iv, 2
  %scevgep8 = getelementptr i8, ptr @sortlist, i64 %20
  %scevgep9 = getelementptr i8, ptr %scevgep8, i64 4
  store i32 %16, ptr %scevgep9, align 4
  br label %21

21:                                               ; preds = %14, %8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %4, !llvm.loop !9

22:                                               ; preds = %4
  %23 = load i32, ptr @top, align 4
  %24 = add nsw i32 %23, -1
  br label %2, !llvm.loop !10

25:                                               ; preds = %2
  %26 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4
  %27 = load i32, ptr @littlest, align 4
  %.not = icmp eq i32 %26, %27
  br i1 %.not, label %28, label %31

28:                                               ; preds = %25
  %29 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 500), align 16
  %30 = load i32, ptr @biggest, align 4
  %.not1 = icmp eq i32 %29, %30
  br i1 %.not1, label %32, label %31

31:                                               ; preds = %28, %25
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %32

32:                                               ; preds = %31, %28
  %33 = add nsw i32 %0, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %36) #3
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %2, %0
  %storemerge = phi i32 [ 0, %0 ], [ %3, %2 ]
  %exitcond = icmp ne i32 %storemerge, 100
  br i1 %exitcond, label %2, label %4

2:                                                ; preds = %1
  call void @Bubble(i32 noundef %storemerge)
  %3 = add nuw nsw i32 %storemerge, 1
  br label %1, !llvm.loop !11

4:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = !{i32 0, i32 65536}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
