; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@1 = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@2 = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define internal i32 @3(i32 noundef %0) local_unnamed_addr #0 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %3, %1
  %accumulator.tr = phi i32 [ 1, %1 ], [ %5, %3 ]
  %.tr = phi i32 [ %0, %1 ], [ %4, %3 ]
  %2 = icmp eq i32 %.tr, 0
  br i1 %2, label %6, label %3

3:                                                ; preds = %tailrecurse
  %4 = add nsw i32 %.tr, -1
  %5 = mul nsw i32 %accumulator.tr, %.tr
  br label %tailrecurse

6:                                                ; preds = %tailrecurse
  %accumulator.ret.tr = mul nsw i32 %accumulator.tr, 1
  ret i32 %accumulator.ret.tr
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(none) uwtable
define internal i32 @4(i32 noundef %0) local_unnamed_addr #1 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %3, label %10

3:                                                ; preds = %1, %8
  %4 = phi i32 [ %9, %8 ], [ 1, %1 ]
  %5 = phi i32 [ %6, %8 ], [ 1, %1 ]
  %6 = mul nsw i32 %4, %5
  %7 = icmp slt i32 %4, %0
  br i1 %7, label %8, label %10, !llvm.loop !6

8:                                                ; preds = %3
  %9 = add nuw nsw i32 %4, 1
  br label %3

10:                                               ; preds = %3, %1
  %11 = phi i32 [ 1, %1 ], [ %6, %3 ]
  ret i32 %11
}

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define internal i32 @5(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %10, label %20

10:                                               ; preds = %2, %16
  %11 = phi i32 [ %14, %16 ], [ 0, %2 ]
  %12 = phi i32 [ %17, %16 ], [ 0, %2 ]
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %4, align 4
  store i32 0, ptr %6, align 4
  call fastcc void @7(ptr nonnull %6, ptr nonnull %3, ptr nonnull %4, ptr nonnull %5, ptr nonnull %7, ptr nonnull %8)
  %14 = add nuw nsw i32 %11, 1
  store i32 %14, ptr %5, align 4
  %15 = icmp slt i32 %14, %0
  br i1 %15, label %16, label %18, !llvm.loop !8

16:                                               ; preds = %10
  %17 = load i32, ptr %4, align 4
  br label %10

18:                                               ; preds = %10
  %19 = load i32, ptr %4, align 4
  br label %20

20:                                               ; preds = %2, %18
  %21 = phi i32 [ %19, %18 ], [ 0, %2 ]
  ret i32 %21
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @6(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #2 {
  br label %3

3:                                                ; preds = %10, %2
  %4 = phi i32 [ 0, %2 ], [ %11, %10 ]
  %5 = phi i32 [ 1, %2 ], [ %14, %10 ]
  %6 = phi i32 [ 2, %2 ], [ %16, %10 ]
  %7 = tail call i32 @5(i32 noundef %5, i32 noundef %6)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @2, i32 noundef %5, i32 noundef %6, i32 noundef %7) #5
  %9 = icmp ult i32 %4, 4
  br i1 %9, label %10, label %17, !llvm.loop !9

10:                                               ; preds = %3
  %11 = add nuw nsw i32 %4, 1
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds [5 x i32], ptr @0, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = getelementptr inbounds [5 x i32], ptr @1, i64 0, i64 %12
  %16 = load i32, ptr %15, align 4
  br label %3

17:                                               ; preds = %3
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #3

; Function Attrs: nofree noinline nosync nounwind memory(argmem: readwrite) uwtable
define internal fastcc void @7(ptr nocapture %0, ptr nocapture readonly %1, ptr nocapture %2, ptr nocapture readonly %3, ptr nocapture %4, ptr nocapture %5) unnamed_addr #4 {
  %7 = load i32, ptr %0, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %27

10:                                               ; preds = %10, %6
  %11 = phi i32 [ %7, %6 ], [ %24, %10 ]
  %12 = load i32, ptr %2, align 4
  %13 = sub nsw i32 %12, %11
  store i32 %13, ptr %2, align 4
  %14 = load i32, ptr %3, align 4
  %15 = tail call i32 @3(i32 noundef %14)
  store i32 %15, ptr %4, align 4
  %16 = load i32, ptr %0, align 4
  %17 = tail call i32 @4(i32 noundef %16)
  store i32 %17, ptr %5, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sub i32 0, %17
  %20 = add i32 %18, %19
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %2, align 4
  %23 = load i32, ptr %0, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %0, align 4
  %25 = load i32, ptr %1, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %10, label %27, !llvm.loop !10

27:                                               ; preds = %10, %6
  ret void
}

attributes #0 = { nofree noinline nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline norecurse nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noinline nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

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
