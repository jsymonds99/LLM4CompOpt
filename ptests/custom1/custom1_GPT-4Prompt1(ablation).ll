; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) #0 {
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
define dso_local i32 @normal_factorial(i32 noundef %0) #1 {
  %smax = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  %2 = add nuw i32 %smax, 1
  %exitcond2 = icmp eq i32 1, %2
  br i1 %exitcond2, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %1
  %3 = add nsw i32 %smax, -1
  %xtraiter = and i32 %smax, 7
  %4 = icmp ult i32 %3, 7
  br i1 %4, label %._crit_edge.unr-lcssa, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = sub i32 %smax, %xtraiter
  br label %5

5:                                                ; preds = %5, %.lr.ph.new
  %.04 = phi i32 [ 1, %.lr.ph.new ], [ %21, %5 ]
  %.013 = phi i32 [ 1, %.lr.ph.new ], [ %20, %5 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.7, %5 ]
  %6 = mul nsw i32 %.013, %.04
  %7 = add nuw nsw i32 %.04, 1
  %8 = mul nsw i32 %6, %7
  %9 = add nuw nsw i32 %.04, 2
  %10 = mul nsw i32 %8, %9
  %11 = add nuw nsw i32 %.04, 3
  %12 = mul nsw i32 %10, %11
  %13 = add nuw nsw i32 %.04, 4
  %14 = mul nsw i32 %12, %13
  %15 = add nuw nsw i32 %.04, 5
  %16 = mul nsw i32 %14, %15
  %17 = add nuw nsw i32 %.04, 6
  %18 = mul nsw i32 %16, %17
  %19 = add nuw i32 %.04, 7
  %20 = mul nsw i32 %18, %19
  %21 = add nuw i32 %.04, 8
  %niter.next.7 = add i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %._crit_edge.unr-lcssa, label %5, !llvm.loop !6

._crit_edge.unr-lcssa:                            ; preds = %5, %.lr.ph
  %.lcssa.ph = phi i32 [ undef, %.lr.ph ], [ %20, %5 ]
  %.04.unr = phi i32 [ 1, %.lr.ph ], [ %21, %5 ]
  %.013.unr = phi i32 [ 1, %.lr.ph ], [ %20, %5 ]
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.epil.preheader, label %._crit_edge

.epil.preheader:                                  ; preds = %._crit_edge.unr-lcssa
  br label %22

22:                                               ; preds = %22, %.epil.preheader
  %.04.epil = phi i32 [ %.04.unr, %.epil.preheader ], [ %24, %22 ]
  %.013.epil = phi i32 [ %.013.unr, %.epil.preheader ], [ %23, %22 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %22 ]
  %23 = mul nsw i32 %.013.epil, %.04.epil
  %24 = add nuw i32 %.04.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp = icmp ne i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp, label %22, label %._crit_edge, !llvm.loop !8

._crit_edge:                                      ; preds = %._crit_edge.unr-lcssa, %22, %1
  %.01.lcssa = phi i32 [ 1, %1 ], [ %.lcssa.ph, %._crit_edge.unr-lcssa ], [ %23, %22 ]
  ret i32 %.01.lcssa
}

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) #0 {
  %smax = tail call i32 @llvm.smax.i32(i32 %1, i32 0)
  %smax3 = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  %exitcond48 = icmp ne i32 0, %smax3
  br i1 %exitcond48, label %.lr.ph12, label %._crit_edge13

.lr.ph12:                                         ; preds = %2
  br label %3

3:                                                ; preds = %.lr.ph12, %._crit_edge
  %.0110 = phi i32 [ 0, %.lr.ph12 ], [ %12, %._crit_edge ]
  %.029 = phi i32 [ 0, %.lr.ph12 ], [ %.1.lcssa, %._crit_edge ]
  %4 = add nsw i32 %.029, %.0110
  %exitcond5 = icmp ne i32 0, %smax
  br i1 %exitcond5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  br label %5

5:                                                ; preds = %.lr.ph, %5
  %.07 = phi i32 [ 0, %.lr.ph ], [ %11, %5 ]
  %.16 = phi i32 [ %4, %.lr.ph ], [ %10, %5 ]
  %6 = tail call i32 @recursive_factorial(i32 noundef %.0110)
  %7 = tail call i32 @normal_factorial(i32 noundef %.07)
  %8 = sub nsw i32 %.16, %.07
  %9 = sub nsw i32 %6, %7
  %10 = add nsw i32 %8, %9
  %11 = add nuw i32 %.07, 1
  %exitcond = icmp ne i32 %11, %smax
  br i1 %exitcond, label %5, label %._crit_edge, !llvm.loop !10

._crit_edge:                                      ; preds = %5, %3
  %.1.lcssa = phi i32 [ %4, %3 ], [ %10, %5 ]
  %12 = add nuw i32 %.0110, 1
  %exitcond4 = icmp ne i32 %12, %smax3
  br i1 %exitcond4, label %3, label %._crit_edge13, !llvm.loop !11

._crit_edge13:                                    ; preds = %._crit_edge, %2
  %.02.lcssa = phi i32 [ 0, %2 ], [ %.1.lcssa, %._crit_edge ]
  ret i32 %.02.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #2 {
  %3 = tail call i32 @doing_something(i32 noundef 1, i32 noundef 2)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1, i32 noundef 2, i32 noundef %3) #6
  %5 = tail call i32 @doing_something(i32 noundef 6, i32 noundef 3)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 6, i32 noundef 3, i32 noundef %5) #6
  %7 = tail call i32 @doing_something(i32 noundef 2, i32 noundef 4)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 2, i32 noundef 4, i32 noundef %7) #6
  %9 = tail call i32 @doing_something(i32 noundef 9, i32 noundef 5)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 9, i32 noundef 5, i32 noundef %9) #6
  %11 = tail call i32 @doing_something(i32 noundef 10, i32 noundef 6)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 10, i32 noundef 6, i32 noundef %11) #6
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #5

attributes #0 = { nofree noinline nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline norecurse nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }

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
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
