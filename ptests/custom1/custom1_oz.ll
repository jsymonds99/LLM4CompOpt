; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(none) uwtable
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
  ret i32 %accumulator.tr
}

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) local_unnamed_addr #1 {
  %smax = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  %2 = add nuw i32 %smax, 1
  br label %3

3:                                                ; preds = %4, %1
  %.06 = phi i32 [ 1, %1 ], [ %5, %4 ]
  %.0 = phi i32 [ 1, %1 ], [ %6, %4 ]
  %exitcond = icmp eq i32 %.0, %2
  br i1 %exitcond, label %7, label %4

4:                                                ; preds = %3
  %5 = mul nsw i32 %.0, %.06
  %6 = add nuw i32 %.0, 1
  br label %3, !llvm.loop !6

7:                                                ; preds = %3
  ret i32 %.06
}

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) local_unnamed_addr #1 {
  %smax = tail call i32 @llvm.smax.i32(i32 %1, i32 0)
  %smax18 = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  br label %3

3:                                                ; preds = %14, %2
  %.016 = phi i32 [ 0, %2 ], [ %15, %14 ]
  %.0 = phi i32 [ 0, %2 ], [ %.1, %14 ]
  %exitcond19.not = icmp eq i32 %.016, %smax18
  br i1 %exitcond19.not, label %16, label %4

4:                                                ; preds = %3
  %5 = add nsw i32 %.0, %.016
  br label %6

6:                                                ; preds = %7, %4
  %.017 = phi i32 [ 0, %4 ], [ %13, %7 ]
  %.1 = phi i32 [ %5, %4 ], [ %12, %7 ]
  %exitcond.not = icmp eq i32 %.017, %smax
  br i1 %exitcond.not, label %14, label %7

7:                                                ; preds = %6
  %8 = tail call i32 @recursive_factorial(i32 noundef %.016)
  %9 = tail call i32 @normal_factorial(i32 noundef %.017)
  %10 = add i32 %.1, %8
  %11 = add i32 %.017, %9
  %12 = sub i32 %10, %11
  %13 = add nuw i32 %.017, 1
  br label %6, !llvm.loop !8

14:                                               ; preds = %6
  %15 = add nuw i32 %.016, 1
  br label %3, !llvm.loop !9

16:                                               ; preds = %3
  ret i32 %.0
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #2 {
  %3 = tail call i32 @doing_something(i32 noundef 1, i32 noundef 2)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1, i32 noundef 2, i32 noundef %3)
  %5 = tail call i32 @doing_something(i32 noundef 6, i32 noundef 3)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 6, i32 noundef 3, i32 noundef %5)
  %7 = tail call i32 @doing_something(i32 noundef 2, i32 noundef 4)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 2, i32 noundef 4, i32 noundef %7)
  %9 = tail call i32 @doing_something(i32 noundef 9, i32 noundef 5)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 9, i32 noundef 5, i32 noundef %9)
  %11 = tail call i32 @doing_something(i32 noundef 10, i32 noundef 6)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 10, i32 noundef 6, i32 noundef %11)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { nofree noinline norecurse nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
