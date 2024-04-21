; ModuleID = 'custom1.c'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(none) uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %6, %1
  %3 = phi i32 [ 1, %1 ], [ %8, %6 ]
  %4 = phi i32 [ %0, %1 ], [ %7, %6 ]
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %9, label %6

6:                                                ; preds = %2
  %7 = add nsw i32 %4, -1
  %8 = mul nsw i32 %4, %3
  br label %2

9:                                                ; preds = %2
  ret i32 %3
}

; Function Attrs: minsize nofree nosync nounwind optsize memory(none) uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) local_unnamed_addr #1 {
  %2 = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  %3 = add nuw i32 %2, 1
  br label %4

4:                                                ; preds = %9, %1
  %5 = phi i32 [ 1, %1 ], [ %10, %9 ]
  %6 = phi i32 [ 1, %1 ], [ %11, %9 ]
  %7 = icmp eq i32 %6, %3
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  ret i32 %5

9:                                                ; preds = %4
  %10 = mul nsw i32 %6, %5
  %11 = add nuw i32 %6, 1
  br label %4, !llvm.loop !5
}

; Function Attrs: minsize nofree nosync nounwind optsize memory(none) uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) local_unnamed_addr #1 {
  %3 = tail call i32 @llvm.smax.i32(i32 %1, i32 0)
  %4 = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  br label %5

5:                                                ; preds = %16, %2
  %6 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %7 = phi i32 [ 0, %2 ], [ %14, %16 ]
  %8 = icmp eq i32 %6, %4
  br i1 %8, label %9, label %10

9:                                                ; preds = %5
  ret i32 %7

10:                                               ; preds = %5
  %11 = add nsw i32 %7, %6
  br label %12

12:                                               ; preds = %18, %10
  %13 = phi i32 [ 0, %10 ], [ %24, %18 ]
  %14 = phi i32 [ %11, %10 ], [ %23, %18 ]
  %15 = icmp eq i32 %13, %3
  br i1 %15, label %16, label %18

16:                                               ; preds = %12
  %17 = add nuw i32 %6, 1
  br label %5, !llvm.loop !7

18:                                               ; preds = %12
  %19 = tail call i32 @recursive_factorial(i32 noundef %6) #5
  %20 = tail call i32 @normal_factorial(i32 noundef %13) #5
  %21 = add i32 %14, %19
  %22 = add i32 %13, %20
  %23 = sub i32 %21, %22
  %24 = add nuw i32 %13, 1
  br label %12, !llvm.loop !8
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #2 {
  br label %3

3:                                                ; preds = %7, %2
  %4 = phi i64 [ %14, %7 ], [ 0, %2 ]
  %5 = icmp eq i64 %4, 5
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  ret i32 0

7:                                                ; preds = %3
  %8 = getelementptr inbounds [5 x i32], ptr @__const.main.as, i64 0, i64 %4
  %9 = load i32, ptr %8, align 4, !tbaa !9
  %10 = getelementptr inbounds [5 x i32], ptr @__const.main.bs, i64 0, i64 %4
  %11 = load i32, ptr %10, align 4, !tbaa !9
  %12 = tail call i32 @doing_something(i32 noundef %9, i32 noundef %11) #5
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %9, i32 noundef %11, i32 noundef %12) #5
  %14 = add nuw nsw i64 %4, 1
  br label %3, !llvm.loop !13
}

; Function Attrs: minsize nofree nounwind optsize
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { minsize nofree norecurse nosync nounwind optsize memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { minsize nofree nosync nounwind optsize memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { minsize nofree nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { minsize nofree nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { minsize optsize }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 17.0.6"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = distinct !{!13, !6}
