; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@1 = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@2 = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %6, %1
  %3 = phi i32 [ 1, %1 ], [ %8, %6 ]
  %4 = phi i32 [ %0, %1 ], [ %7, %6 ]
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %9, label %6

6:                                                ; preds = %2
  %7 = add nsw i32 %4, -1
  %8 = mul nsw i32 %3, %4
  br label %2

9:                                                ; preds = %2
  %10 = mul nsw i32 %3, 1
  ret i32 %10
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) #1 {
  %2 = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  %3 = add nuw i32 %2, 1
  br label %4

4:                                                ; preds = %8, %1
  %5 = phi i32 [ 1, %1 ], [ %9, %8 ]
  %6 = phi i32 [ 1, %1 ], [ %10, %8 ]
  %7 = icmp eq i32 %6, %3
  br i1 %7, label %11, label %8

8:                                                ; preds = %4
  %9 = mul nsw i32 %6, %5
  %10 = add nuw i32 %6, 1
  br label %4, !llvm.loop !6

11:                                               ; preds = %4
  %12 = phi i32 [ %5, %4 ]
  ret i32 %12
}

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) #0 {
  %3 = tail call i32 @llvm.smax.i32(i32 %1, i32 0)
  %4 = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  br label %5

5:                                                ; preds = %24, %2
  %6 = phi i32 [ 0, %2 ], [ %25, %24 ]
  %7 = phi i32 [ 0, %2 ], [ %26, %24 ]
  %8 = icmp ne i32 %7, %4
  br i1 %8, label %9, label %27

9:                                                ; preds = %5
  %10 = add nsw i32 %7, %6
  br label %11

11:                                               ; preds = %15, %9
  %12 = phi i32 [ %10, %9 ], [ %22, %15 ]
  %13 = phi i32 [ 0, %9 ], [ %23, %15 ]
  %14 = icmp ne i32 %13, %3
  br i1 %14, label %15, label %24

15:                                               ; preds = %11
  %16 = sub i32 0, %13
  %17 = tail call i32 @recursive_factorial(i32 noundef %7)
  %18 = tail call i32 @normal_factorial(i32 noundef %13)
  %19 = sub i32 0, %18
  %20 = add i32 %16, %12
  %21 = add i32 %20, %17
  %22 = add i32 %21, %19
  %23 = add nuw i32 %13, 1
  br label %11, !llvm.loop !8

24:                                               ; preds = %11
  %25 = phi i32 [ %12, %11 ]
  %26 = add nuw i32 %7, 1
  br label %5, !llvm.loop !9

27:                                               ; preds = %5
  %28 = phi i32 [ %6, %5 ]
  ret i32 %28
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) #2 {
  %3 = tail call i32 @doing_something(i32 noundef 1, i32 noundef 2)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @2, i32 noundef 1, i32 noundef 2, i32 noundef %3) #5
  %5 = tail call i32 @doing_something(i32 noundef 6, i32 noundef 3)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @2, i32 noundef 6, i32 noundef 3, i32 noundef %5) #5
  %7 = tail call i32 @doing_something(i32 noundef 2, i32 noundef 4)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @2, i32 noundef 2, i32 noundef 4, i32 noundef %7) #5
  %9 = tail call i32 @doing_something(i32 noundef 9, i32 noundef 5)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @2, i32 noundef 9, i32 noundef 5, i32 noundef %9) #5
  %11 = tail call i32 @doing_something(i32 noundef 10, i32 noundef 6)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @2, i32 noundef 10, i32 noundef 6, i32 noundef %11) #5
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { nofree noinline nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline norecurse nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
