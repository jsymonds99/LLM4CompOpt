; ModuleID = 'towers_unoptimized.ll'
source_filename = "towers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [22 x i8] c" Error in Towers: %s\0A\00", align 1
@stack = dso_local global [4 x i32] zeroinitializer, align 16
@freelist = dso_local global i32 0, align 4
@cellspace = dso_local global [19 x %struct.element] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [16 x i8] c"out of space   \00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"disc size error\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"nothing to pop \00", align 1
@movesdone = dso_local global i32 0, align 4
@.str.4 = private unnamed_addr constant [19 x i8] c" Error in Towers.\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local global float 0.000000e+00, align 4
@fixed = dso_local global float 0.000000e+00, align 4
@floated = dso_local global float 0.000000e+00, align 4
@permarray = dso_local global [11 x i32] zeroinitializer, align 16
@pctr = dso_local global i32 0, align 4
@tree = dso_local global ptr null, align 8
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
@str = private unnamed_addr constant [18 x i8] c" Error in Towers.\00", align 1

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

; Function Attrs: noinline nounwind uwtable
define dso_local void @Error(ptr noundef %0) #2 {
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, ptr noundef %0) #5
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @Makenull(i32 noundef %0) #0 {
  %2 = sext i32 %0 to i64
  %3 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %2
  store i32 0, ptr %3, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Getelement() #2 {
  %1 = load i32, ptr @freelist, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %7

3:                                                ; preds = %0
  %4 = zext i32 %1 to i64
  %5 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %4, i32 1
  %6 = load i32, ptr %5, align 4
  store i32 %6, ptr @freelist, align 4
  br label %8

7:                                                ; preds = %0
  tail call void @Error(ptr noundef nonnull @.str.1)
  br label %8

8:                                                ; preds = %7, %3
  %.0 = phi i32 [ %1, %3 ], [ 0, %7 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Push(i32 noundef %0, i32 noundef %1) #2 {
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %3
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %2
  %8 = zext i32 %5 to i64
  %9 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %8
  %10 = load i32, ptr %9, align 8
  %.not1 = icmp sgt i32 %10, %0
  br i1 %.not1, label %12, label %11

11:                                               ; preds = %7
  tail call void @Error(ptr noundef nonnull @.str.2)
  br label %18

12:                                               ; preds = %2, %7
  %13 = tail call i32 @Getelement(), !range !6
  %14 = load i32, ptr %4, align 4
  %15 = zext i32 %13 to i64
  %16 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %15, i32 1
  store i32 %14, ptr %16, align 4
  store i32 %13, ptr %4, align 4
  %17 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %15
  store i32 %0, ptr %17, align 8
  br label %18

18:                                               ; preds = %11, %12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Init(i32 noundef %0, i32 noundef %1) #2 {
  tail call void @Makenull(i32 noundef %0)
  br label %3

3:                                                ; preds = %5, %2
  %storemerge = phi i32 [ %1, %2 ], [ %6, %5 ]
  %4 = icmp sgt i32 %storemerge, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  tail call void @Push(i32 noundef %storemerge, i32 noundef %0)
  %6 = add nsw i32 %storemerge, -1
  br label %3, !llvm.loop !7

7:                                                ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Pop(i32 noundef %0) #2 {
  %2 = sext i32 %0 to i64
  %3 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %2
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %13

6:                                                ; preds = %1
  %7 = zext i32 %4 to i64
  %8 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %7
  %9 = load i32, ptr %8, align 8
  %10 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %7, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = load i32, ptr @freelist, align 4
  store i32 %12, ptr %10, align 4
  store i32 %4, ptr @freelist, align 4
  store i32 %11, ptr %3, align 4
  br label %14

13:                                               ; preds = %1
  tail call void @Error(ptr noundef nonnull @.str.3)
  br label %14

14:                                               ; preds = %13, %6
  %storemerge = phi i32 [ 0, %13 ], [ %9, %6 ]
  ret i32 %storemerge
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Move(i32 noundef %0, i32 noundef %1) #2 {
  %3 = tail call i32 @Pop(i32 noundef %0)
  tail call void @Push(i32 noundef %3, i32 noundef %1)
  %4 = load i32, ptr @movesdone, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, ptr @movesdone, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @tower(i32 noundef %0, i32 noundef %1, i32 noundef %2) #2 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %6, %3
  %.tr = phi i32 [ %0, %3 ], [ %7, %6 ]
  %.tr10 = phi i32 [ %2, %3 ], [ %8, %6 ]
  %4 = icmp eq i32 %.tr10, 1
  br i1 %4, label %5, label %6

5:                                                ; preds = %tailrecurse
  tail call void @Move(i32 noundef %.tr, i32 noundef %1)
  ret void

6:                                                ; preds = %tailrecurse
  %.neg = sub i32 0, %1
  %.tr.neg = sub i32 0, %.tr
  %.neg11 = add i32 %.neg, 6
  %7 = add i32 %.neg11, %.tr.neg
  %8 = add nsw i32 %.tr10, -1
  tail call void @tower(i32 noundef %.tr, i32 noundef %7, i32 noundef %8)
  tail call void @Move(i32 noundef %.tr, i32 noundef %1)
  br label %tailrecurse
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Towers() #2 {
  br label %1

1:                                                ; preds = %2, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %2 ], [ 1, %0 ]
  %exitcond = icmp ne i64 %indvars.iv, 19
  br i1 %exitcond, label %2, label %6

2:                                                ; preds = %1
  %3 = add nsw i64 %indvars.iv, -1
  %4 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %indvars.iv, i32 1
  %5 = trunc i64 %3 to i32
  store i32 %5, ptr %4, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %1, !llvm.loop !9

6:                                                ; preds = %1
  store i32 18, ptr @freelist, align 4
  tail call void @Init(i32 noundef 1, i32 noundef 14)
  tail call void @Makenull(i32 noundef 2)
  tail call void @Makenull(i32 noundef 3)
  store i32 0, ptr @movesdone, align 4
  tail call void @tower(i32 noundef 1, i32 noundef 2, i32 noundef 14)
  %7 = load i32, ptr @movesdone, align 4
  %.not = icmp eq i32 %7, 16383
  br i1 %.not, label %9, label %8

8:                                                ; preds = %6
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %.pre = load i32, ptr @movesdone, align 4
  br label %9

9:                                                ; preds = %8, %6
  %10 = phi i32 [ %.pre, %8 ], [ 16383, %6 ]
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %10) #5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #2 {
  br label %1

1:                                                ; preds = %2, %0
  %storemerge = phi i32 [ 0, %0 ], [ %3, %2 ]
  %exitcond = icmp ne i32 %storemerge, 100
  br i1 %exitcond, label %2, label %4

2:                                                ; preds = %1
  tail call void @Towers()
  %3 = add nuw nsw i32 %storemerge, 1
  br label %1, !llvm.loop !10

4:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #4

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = !{i32 0, i32 -2147483648}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
