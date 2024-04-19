; ModuleID = 'queens_unoptimized.ll'
source_filename = "queens.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i32 }
%1 = type { float, float }

@seed = dso_local global i64 0, align 8
@0 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local global float 0.000000e+00, align 4
@fixed = dso_local global float 0.000000e+00, align 4
@floated = dso_local global float 0.000000e+00, align 4
@permarray = dso_local global [11 x i32] zeroinitializer, align 16
@pctr = dso_local global i32 0, align 4
@tree = dso_local global ptr null, align 8
@stack = dso_local global [4 x i32] zeroinitializer, align 16
@cellspace = dso_local global [19 x %0] zeroinitializer, align 16
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
@z = dso_local global [257 x %1] zeroinitializer, align 16
@w = dso_local global [257 x %1] zeroinitializer, align 16
@e = dso_local global [130 x %1] zeroinitializer, align 16
@zr = dso_local global float 0.000000e+00, align 4
@zi = dso_local global float 0.000000e+00, align 4
@1 = private unnamed_addr constant [18 x i8] c" Error in Queens.\00", align 1

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

; Function Attrs: nofree noinline nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @Try(i32 noundef %0, ptr nocapture noundef %1, ptr nocapture noundef %2, ptr nocapture noundef %3, ptr nocapture noundef %4, ptr nocapture noundef writeonly %5) #2 {
  store i32 0, ptr %1, align 4
  %7 = add i32 %0, 6
  %8 = zext i32 %0 to i64
  br label %9

9:                                                ; preds = %6, %42
  %10 = phi i32 [ 0, %6 ], [ %44, %42 ]
  %11 = phi i64 [ 1, %6 ], [ %45, %42 ]
  store i32 0, ptr %1, align 4
  %12 = shl nuw nsw i64 %11, 2
  %13 = getelementptr i8, ptr %3, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %42, label %16

16:                                               ; preds = %9
  %17 = add i64 %8, %11
  %18 = trunc i64 %17 to i32
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, ptr %2, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %42, label %23

23:                                               ; preds = %16
  %24 = add i32 %7, %10
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %4, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %42, label %29

29:                                               ; preds = %23
  %30 = sext i32 %0 to i64
  %31 = getelementptr inbounds i32, ptr %5, i64 %30
  %32 = trunc i64 %11 to i32
  store i32 %32, ptr %31, align 4
  store i32 0, ptr %13, align 4
  store i32 0, ptr %20, align 4
  store i32 0, ptr %26, align 4
  %33 = trunc i64 %8 to i32
  %34 = icmp slt i32 %33, 8
  br i1 %34, label %35, label %41

35:                                               ; preds = %29
  %36 = add nsw i32 %0, 1
  tail call void @Try(i32 noundef %36, ptr noundef nonnull %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %37 = load i32, ptr %1, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %42

39:                                               ; preds = %35
  store i32 1, ptr %13, align 4
  store i32 1, ptr %20, align 4
  store i32 1, ptr %26, align 4
  %40 = load i32, ptr %1, align 4
  br label %42

41:                                               ; preds = %29
  store i32 1, ptr %1, align 4
  br label %42

42:                                               ; preds = %41, %39, %35, %23, %16, %9
  %43 = phi i32 [ 1, %41 ], [ %40, %39 ], [ %37, %35 ], [ 0, %23 ], [ 0, %16 ], [ 0, %9 ]
  %44 = add nsw i32 %10, -1
  %45 = add nuw nsw i64 %11, 1
  %46 = icmp eq i32 %43, 0
  %47 = icmp ne i32 %44, -8
  %48 = select i1 %46, i1 %47, i1 false
  br i1 %48, label %9, label %49, !llvm.loop !6

49:                                               ; preds = %42
  ret void
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @Doit() #3 {
  %1 = alloca i32, align 4
  %2 = alloca [9 x i32], align 16
  %3 = alloca [17 x i32], align 16
  %4 = alloca [15 x i32], align 16
  %5 = alloca [9 x i32], align 16
  br label %6

6:                                                ; preds = %0, %29
  %7 = phi i64 [ -7, %0 ], [ %30, %29 ]
  %8 = trunc i64 %7 to i32
  %9 = icmp sgt i32 %8, 0
  %10 = trunc i64 %7 to i32
  %11 = icmp slt i32 %10, 9
  %12 = and i1 %9, %11
  br i1 %12, label %13, label %16

13:                                               ; preds = %6
  %14 = shl nsw i64 %7, 2
  %15 = getelementptr i8, ptr %2, i64 %14
  store i32 1, ptr %15, align 4
  br label %16

16:                                               ; preds = %13, %6
  %17 = trunc i64 %7 to i32
  %18 = icmp sgt i32 %17, 1
  br i1 %18, label %19, label %22

19:                                               ; preds = %16
  %20 = shl nsw i64 %7, 2
  %21 = getelementptr i8, ptr %3, i64 %20
  store i32 1, ptr %21, align 4
  br label %22

22:                                               ; preds = %19, %16
  %23 = trunc i64 %7 to i32
  %24 = icmp slt i32 %23, 8
  br i1 %24, label %25, label %29

25:                                               ; preds = %22
  %26 = shl nsw i64 %7, 2
  %27 = getelementptr i8, ptr %4, i64 %26
  %28 = getelementptr i8, ptr %27, i64 28
  store i32 1, ptr %28, align 4
  br label %29

29:                                               ; preds = %25, %22
  %30 = add nsw i64 %7, 1
  %31 = trunc i64 %30 to i32
  %32 = icmp slt i32 %31, 17
  br i1 %32, label %6, label %33, !llvm.loop !8

33:                                               ; preds = %29
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %34 = load i32, ptr %1, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %38

36:                                               ; preds = %33
  %37 = call i32 @puts(ptr nonnull dereferenceable(1) @1)
  br label %38

38:                                               ; preds = %36, %33
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #5 {
  br label %2

2:                                                ; preds = %1, %2
  %3 = phi i32 [ 1, %1 ], [ %4, %2 ]
  tail call void @Doit()
  %4 = add nuw nsw i32 %3, 1
  %5 = icmp ult i32 %4, 51
  br i1 %5, label %2, label %6, !llvm.loop !9

6:                                                ; preds = %2
  %7 = add nsw i32 %0, 1
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %7) #7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #5 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i32 [ 0, %0 ], [ %3, %1 ]
  tail call void @Queens(i32 noundef %2)
  %3 = add nuw nsw i32 %2, 1
  %4 = icmp ult i32 %3, 100
  br i1 %4, label %1, label %5, !llvm.loop !10

5:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #6

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind }

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
