; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@1 = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@2 = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) local_unnamed_addr #0 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %3, %1
  %accumulator.tr = phi i32 [ 1, %1 ], [ %5, %3 ]
  %.tr = phi i32 [ %0, %1 ], [ %4, %3 ]
  %2 = icmp eq i32 %.tr, 0
  br i1 %2, label %6, label %3

3:                                                ; preds = %tailrecurse
  %4 = add nsw i32 %.tr, -1
  %5 = mul nsw i32 %.tr, %accumulator.tr
  br label %tailrecurse

6:                                                ; preds = %tailrecurse
  %accumulator.ret.tr = mul nsw i32 1, %accumulator.tr
  ret i32 %accumulator.ret.tr
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %3, %1
  %.0 = phi i32 [ 1, %1 ], [ %4, %3 ]
  %storemerge = phi i32 [ 1, %1 ], [ %5, %3 ]
  %.not = icmp sgt i32 %storemerge, %0
  br i1 %.not, label %6, label %3

3:                                                ; preds = %2
  %4 = mul nsw i32 %.0, %storemerge
  %5 = add nsw i32 %storemerge, 1
  br label %2, !llvm.loop !6

6:                                                ; preds = %2
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %16, %2
  %.0 = phi i32 [ 0, %2 ], [ %.1, %16 ]
  %storemerge = phi i32 [ 0, %2 ], [ %17, %16 ]
  %4 = icmp slt i32 %storemerge, %0
  br i1 %4, label %5, label %18

5:                                                ; preds = %3
  %6 = add nsw i32 %.0, %storemerge
  br label %7

7:                                                ; preds = %9, %5
  %.1 = phi i32 [ %6, %5 ], [ %14, %9 ]
  %storemerge1 = phi i32 [ 0, %5 ], [ %15, %9 ]
  %8 = icmp slt i32 %storemerge1, %1
  br i1 %8, label %9, label %16

9:                                                ; preds = %7
  %10 = sub nsw i32 %.1, %storemerge1
  %11 = tail call i32 @recursive_factorial(i32 noundef %storemerge)
  %12 = tail call i32 @normal_factorial(i32 noundef %storemerge1)
  %13 = sub nsw i32 %11, %12
  %14 = add nsw i32 %10, %13
  %15 = add nsw i32 %storemerge1, 1
  br label %7, !llvm.loop !8

16:                                               ; preds = %7
  %17 = add nsw i32 %storemerge, 1
  br label %3, !llvm.loop !9

18:                                               ; preds = %3
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %5, %2
  %storemerge = phi i32 [ 0, %2 ], [ %13, %5 ]
  %4 = icmp slt i32 %storemerge, 5
  br i1 %4, label %5, label %14

5:                                                ; preds = %3
  %6 = sext i32 %storemerge to i64
  %7 = getelementptr inbounds [5 x i32], ptr @0, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr inbounds [5 x i32], ptr @1, i64 0, i64 %6
  %10 = load i32, ptr %9, align 4
  %11 = tail call i32 @doing_something(i32 noundef %8, i32 noundef %10)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @2, i32 noundef %8, i32 noundef %10, i32 noundef %11) #2
  %13 = add nsw i32 %storemerge, 1
  br label %3, !llvm.loop !10

14:                                               ; preds = %3
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

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
