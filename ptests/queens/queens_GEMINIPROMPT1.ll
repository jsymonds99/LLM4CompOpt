; ModuleID = 'queens_unoptimized.ll'
source_filename = "queens.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local global i64 0, align 8
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
@str = private unnamed_addr constant [18 x i8] c" Error in Queens.\00", align 1

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
define dso_local void @Try(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  store i32 0, ptr %1, align 4
  %7 = sext i32 %0 to i64
  %8 = shl nsw i64 %7, 2
  %9 = add nsw i64 %8, 24
  %scevgep = getelementptr i8, ptr %4, i64 %9
  %scevgep12 = getelementptr i8, ptr %2, i64 %8
  br label %10

10:                                               ; preds = %34, %6
  %lsr.iv10 = phi ptr [ %scevgep11, %34 ], [ %scevgep, %6 ]
  %lsr.iv = phi i64 [ %lsr.iv.next, %34 ], [ -8, %6 ]
  %11 = phi ptr [ %35, %34 ], [ %1, %6 ]
  %12 = phi ptr [ %36, %34 ], [ %1, %6 ]
  %13 = phi i32 [ %.pre, %34 ], [ 0, %6 ]
  %.not = icmp eq i32 %13, 0
  %14 = icmp ne i64 %lsr.iv, 0
  %15 = select i1 %.not, i1 %14, i1 false
  br i1 %15, label %16, label %37

16:                                               ; preds = %10
  store i32 0, ptr %12, align 4
  %17 = shl nsw i64 %lsr.iv, 2
  %scevgep15 = getelementptr i8, ptr %3, i64 %17
  %scevgep16 = getelementptr i8, ptr %scevgep15, i64 36
  %18 = load i32, ptr %scevgep16, align 4
  %.not1 = icmp eq i32 %18, 0
  br i1 %.not1, label %34, label %19

19:                                               ; preds = %16
  %20 = shl nsw i64 %lsr.iv, 2
  %scevgep13 = getelementptr i8, ptr %scevgep12, i64 %20
  %scevgep14 = getelementptr i8, ptr %scevgep13, i64 36
  %21 = load i32, ptr %scevgep14, align 4
  %.not2 = icmp eq i32 %21, 0
  br i1 %.not2, label %34, label %22

22:                                               ; preds = %19
  %23 = load i32, ptr %lsr.iv10, align 4
  %.not3 = icmp eq i32 %23, 0
  br i1 %.not3, label %34, label %24

24:                                               ; preds = %22
  %25 = sext i32 %0 to i64
  %26 = getelementptr inbounds i32, ptr %5, i64 %25
  %27 = add i64 %lsr.iv, 9
  %tmp = trunc i64 %27 to i32
  store i32 %tmp, ptr %26, align 4
  store i32 0, ptr %scevgep16, align 4
  store i32 0, ptr %scevgep14, align 4
  store i32 0, ptr %lsr.iv10, align 4
  %28 = icmp slt i32 %0, 8
  br i1 %28, label %29, label %33

29:                                               ; preds = %24
  %30 = add nsw i32 %0, 1
  tail call void @Try(i32 noundef %30, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %31 = load i32, ptr %1, align 4
  %.not4 = icmp eq i32 %31, 0
  br i1 %.not4, label %32, label %34

32:                                               ; preds = %29
  store i32 1, ptr %scevgep16, align 4
  store i32 1, ptr %scevgep14, align 4
  store i32 1, ptr %lsr.iv10, align 4
  %.pre.pre = load i32, ptr %1, align 4
  br label %34

33:                                               ; preds = %24
  store i32 1, ptr %11, align 4
  br label %34

34:                                               ; preds = %33, %32, %29, %22, %19, %16
  %.pre = phi i32 [ 1, %33 ], [ %.pre.pre, %32 ], [ %31, %29 ], [ 0, %22 ], [ 0, %19 ], [ 0, %16 ]
  %35 = phi ptr [ %11, %33 ], [ %1, %32 ], [ %1, %29 ], [ %11, %22 ], [ %11, %19 ], [ %11, %16 ]
  %36 = phi ptr [ %11, %33 ], [ %1, %32 ], [ %1, %29 ], [ %12, %22 ], [ %12, %19 ], [ %12, %16 ]
  %lsr.iv.next = add nsw i64 %lsr.iv, 1
  %scevgep11 = getelementptr i8, ptr %lsr.iv10, i64 -4
  br label %10, !llvm.loop !6

37:                                               ; preds = %10
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

6:                                                ; preds = %18, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %18 ], [ -7, %0 ]
  %exitcond = icmp ne i64 %indvars.iv, 17
  br i1 %exitcond, label %7, label %19

7:                                                ; preds = %6
  %8 = icmp sgt i64 %indvars.iv, 0
  %9 = icmp slt i64 %indvars.iv, 9
  %or.cond = select i1 %8, i1 %9, i1 false
  br i1 %or.cond, label %10, label %12

10:                                               ; preds = %7
  %11 = shl nsw i64 %indvars.iv, 2
  %scevgep5 = getelementptr i8, ptr %2, i64 %11
  store i32 1, ptr %scevgep5, align 4
  br label %12

12:                                               ; preds = %10, %7
  %13 = icmp sgt i64 %indvars.iv, 1
  br i1 %13, label %14, label %.thread

14:                                               ; preds = %12
  %15 = shl nsw i64 %indvars.iv, 2
  %scevgep4 = getelementptr i8, ptr %3, i64 %15
  store i32 1, ptr %scevgep4, align 4
  %16 = icmp slt i64 %indvars.iv, 8
  br i1 %16, label %.thread, label %18

.thread:                                          ; preds = %12, %14
  %17 = shl nsw i64 %indvars.iv, 2
  %scevgep = getelementptr i8, ptr %4, i64 %17
  %scevgep3 = getelementptr i8, ptr %scevgep, i64 28
  store i32 1, ptr %scevgep3, align 4
  br label %18

18:                                               ; preds = %.thread, %14
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  br label %6, !llvm.loop !8

19:                                               ; preds = %6
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %20 = load i32, ptr %1, align 4
  %.not = icmp eq i32 %20, 0
  br i1 %.not, label %21, label %22

21:                                               ; preds = %19
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %22

22:                                               ; preds = %21, %19
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %3, %1
  %lsr.iv = phi i32 [ %lsr.iv.next, %3 ], [ 50, %1 ]
  %exitcond = icmp ne i32 %lsr.iv, 0
  br i1 %exitcond, label %3, label %4

3:                                                ; preds = %2
  tail call void @Doit()
  %lsr.iv.next = add nsw i32 %lsr.iv, -1
  br label %2, !llvm.loop !9

4:                                                ; preds = %2
  %5 = add nsw i32 %0, 1
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %5) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %3, %0
  %2 = phi i32 [ 0, %0 ], [ %4, %3 ]
  %exitcond = icmp ne i32 %2, 100
  br i1 %exitcond, label %3, label %5

3:                                                ; preds = %1
  tail call void @Queens(i32 noundef %2)
  %4 = add nuw nsw i32 %2, 1
  br label %1, !llvm.loop !10

5:                                                ; preds = %1
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
