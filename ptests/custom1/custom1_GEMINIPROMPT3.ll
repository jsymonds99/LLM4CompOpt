; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %7, label %3

3:                                                ; preds = %1
  %4 = add nsw i32 %0, -1
  %5 = call i32 @recursive_factorial(i32 noundef %4)
  %6 = mul nsw i32 %5, %0
  br label %7

7:                                                ; preds = %1, %3
  %8 = phi i32 [ %6, %3 ], [ 1, %1 ]
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %xtraiter = and i32 %0, 7
  %3 = icmp ult i32 %0, 8
  br i1 %3, label %._crit_edge.unr-lcssa, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %4 = and i32 %0, -8
  br label %5

5:                                                ; preds = %5, %.lr.ph.new
  %lsr.iv3 = phi i32 [ %lsr.iv.next4, %5 ], [ 8, %.lr.ph.new ]
  %6 = phi i32 [ %21, %5 ], [ 1, %.lr.ph.new ]
  %7 = add i32 %lsr.iv3, -7
  %8 = add i32 %lsr.iv3, -6
  %9 = add i32 %lsr.iv3, -5
  %10 = add i32 %lsr.iv3, -4
  %11 = add i32 %lsr.iv3, -3
  %12 = add i32 %lsr.iv3, -2
  %13 = add i32 %lsr.iv3, -1
  %14 = mul i32 %7, %lsr.iv3
  %15 = mul i32 %14, %6
  %16 = mul i32 %15, %8
  %17 = mul i32 %16, %9
  %18 = mul i32 %17, %10
  %19 = mul i32 %18, %11
  %20 = mul i32 %19, %12
  %21 = mul i32 %20, %13
  %lsr.iv.next4 = add i32 %lsr.iv3, 8
  %22 = sub i32 %lsr.iv.next4, %4
  %niter.ncmp.7.not = icmp eq i32 %22, 8
  br i1 %niter.ncmp.7.not, label %._crit_edge.unr-lcssa.loopexit, label %5, !llvm.loop !6

._crit_edge.unr-lcssa.loopexit:                   ; preds = %5
  %23 = or i32 %lsr.iv3, 1
  br label %._crit_edge.unr-lcssa

._crit_edge.unr-lcssa:                            ; preds = %._crit_edge.unr-lcssa.loopexit, %.lr.ph
  %split.ph = phi i32 [ undef, %.lr.ph ], [ %21, %._crit_edge.unr-lcssa.loopexit ]
  %.unr = phi i32 [ 1, %.lr.ph ], [ %23, %._crit_edge.unr-lcssa.loopexit ]
  %.unr1 = phi i32 [ 1, %.lr.ph ], [ %21, %._crit_edge.unr-lcssa.loopexit ]
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.unr-lcssa, %.epil.preheader
  %lsr.iv = phi i32 [ %lsr.iv.next, %.epil.preheader ], [ %xtraiter, %._crit_edge.unr-lcssa ]
  %24 = phi i32 [ %27, %.epil.preheader ], [ %.unr, %._crit_edge.unr-lcssa ]
  %25 = phi i32 [ %26, %.epil.preheader ], [ %.unr1, %._crit_edge.unr-lcssa ]
  %26 = mul nsw i32 %25, %24
  %27 = add nuw nsw i32 %24, 1
  %lsr.iv.next = add nsw i32 %lsr.iv, -1
  %epil.iter.cmp.not = icmp eq i32 %lsr.iv.next, 0
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %.epil.preheader, !llvm.loop !8

._crit_edge:                                      ; preds = %._crit_edge.unr-lcssa, %.epil.preheader, %1
  %.lcssa = phi i32 [ 1, %1 ], [ %split.ph, %._crit_edge.unr-lcssa ], [ %26, %.epil.preheader ]
  ret i32 %.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.lr.ph3, label %._crit_edge4

.lr.ph3:                                          ; preds = %2, %._crit_edge
  %4 = phi i32 [ %16, %._crit_edge ], [ 0, %2 ]
  %5 = phi i32 [ %.lcssa, %._crit_edge ], [ 0, %2 ]
  %6 = add nsw i32 %5, %4
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph3, %.lr.ph
  %8 = phi i32 [ %14, %.lr.ph ], [ %6, %.lr.ph3 ]
  %9 = phi i32 [ %15, %.lr.ph ], [ 0, %.lr.ph3 ]
  %10 = sub nsw i32 %8, %9
  %11 = call i32 @recursive_factorial(i32 noundef %4)
  %12 = call i32 @normal_factorial(i32 noundef %9)
  %13 = sub nsw i32 %11, %12
  %14 = add nsw i32 %13, %10
  %15 = add nuw nsw i32 %9, 1
  %exitcond.not = icmp eq i32 %15, %1
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !10

._crit_edge:                                      ; preds = %.lr.ph, %.lr.ph3
  %.lcssa = phi i32 [ %6, %.lr.ph3 ], [ %14, %.lr.ph ]
  %16 = add nuw nsw i32 %4, 1
  %exitcond6.not = icmp eq i32 %16, %0
  br i1 %exitcond6.not, label %._crit_edge4, label %.lr.ph3, !llvm.loop !11

._crit_edge4:                                     ; preds = %._crit_edge, %2
  %.lcssa1 = phi i32 [ 0, %2 ], [ %.lcssa, %._crit_edge ]
  ret i32 %.lcssa1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = call i32 @doing_something(i32 noundef 1, i32 noundef 2)
  %4 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1, i32 noundef 2, i32 noundef %3) #3
  %5 = call i32 @doing_something(i32 noundef 6, i32 noundef 3)
  %6 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 6, i32 noundef 3, i32 noundef %5) #3
  %7 = call i32 @doing_something(i32 noundef 2, i32 noundef 4)
  %8 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 2, i32 noundef 4, i32 noundef %7) #3
  %9 = call i32 @doing_something(i32 noundef 9, i32 noundef 5)
  %10 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 9, i32 noundef 5, i32 noundef %9) #3
  %11 = call i32 @doing_something(i32 noundef 10, i32 noundef 6)
  %12 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 10, i32 noundef 6, i32 noundef %11) #3
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
